const { app, BrowserWindow, nativeTheme } = require('electron')
const path = require('path')

nativeTheme.themeSource = 'light';

function createWindow () {
    const win = new BrowserWindow({
        width: 1000,
        height: 600,
        frame: false,
        titleBarStyle: "hidden",
        icon: path.join(__dirname, "/assets/icon.ico"),
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            nodeIntegration: true,
            enableRemoteModule: true,
            contextIsolation: false,
        }
    })
    
    win.removeMenu()
    win.setMenuBarVisibility(false)
    //win.toggleDevTools()
    win.loadFile('index.html')
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
