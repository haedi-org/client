function openBrowser(url) {
    const execSync = require('child_process').execSync;
    execSync(`start ${url}`)
}

function openFile(path) {
    const execSync = require('child_process').execSync;
    execSync(`start ${path}`)
}