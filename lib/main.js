const { app, BrowserWindow, nativeTheme, ipcMain } = require('electron')
const path = require('path');
const { kill } = require('process');
nativeTheme.themeSource = 'light';
// Load config.ini
const fs = require('fs')
const ini = require('ini');
const config = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));

let win;
let pids = [];

function createWindow () {
    var width = config.general.debug ? 1400 : 1000;
    win = new BrowserWindow({
        width: width,
        height: 600,
        frame: false,
        titleBarStyle: "hidden",
        icon: path.join(__dirname, "../assets/rocket_without_flame_tilt.png"),
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            nodeIntegration: true,
            enableRemoteModule: true,
            contextIsolation: false,
        }
    })
    if (config.general.debug) {
        win.toggleDevTools()
    }
    win.removeMenu()
    win.setMenuBarVisibility(false)
    win.loadFile('html/index.html')
    // Kill all child processes on close
    win.on('close', function() {
        for (const pid of pids) {
            console.log("Killing process", pid);
            win.webContents.send('kill-process', { pid: pid });
        }
    });
}

app.whenReady().then(() => {
    createWindow()
    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) {
            createWindow()
        }
    })
})

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit()
    }
})

ipcMain.on('add-process', (ev, payload) => {
    pids.push(payload.pid);
    console.log("Added process", payload.pid);
});

ipcMain.on('open-page',  (ev, payload) => {
    win.loadFile(payload);
});

ipcMain.on('get-app-info', function (ev, payload) {
    if (payload == 'name') {
        win.webContents.send('receive-app-name', app.getName());
    }
    if (payload == 'version') {
        win.webContents.send('receive-app-version', app.getVersion());
    }
});