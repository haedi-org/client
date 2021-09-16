const { app, BrowserWindow, nativeTheme, ipcMain } = require('electron')
const path = require('path');
const { kill } = require('process');
nativeTheme.themeSource = 'light';

let win;
let pids = [];

function createWindow () {
    win = new BrowserWindow({
        width: 1400,
        height: 600,
        frame: false,
        titleBarStyle: "hidden",
        icon: path.join(__dirname, "../assets/sparkle_multi.png"),
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            nodeIntegration: true,
            enableRemoteModule: true,
            contextIsolation: false,
        }
    })
    win.toggleDevTools()
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