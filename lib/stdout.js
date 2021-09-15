const fs = require('fs')
const ini = require('ini')
const { ipcRenderer } = require('electron')

const config = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));

var cli_arguments = ['--headless', '--html'];

var spawnedShell = require('child_process').spawn(
    config.executables.cli, 
    cli_arguments, 
    { 
        cwd: config.paths.cli
    }
);

var shells = [spawnedShell];
var buffer = "";

ipcRenderer.send('add-process', { pid: spawnedShell.pid });

spawnedShell.stdout.on('data', function (data) {
    console.log('stdout: ', data.toString());
    setRubyOutput(data.toString());
});
  
spawnedShell.stderr.on('data', function (data) {
    console.log('stderr: ', data.toString());
    setRubyOutput('ERR');
});

ipcRenderer.on('kill-process', (ev, payload) => {
    for (const shell of shells) {
        if (payload.pid == shell.pid) {
            shell.stdin.cork();
            shell.stdin.write(`q`);
            shell.stdin.uncork();
            shell.kill('SIGINT');
        }
    }
});

function runCommand(dir = 'edifact', tags = '--parse', path = '') {
    var command = `${tags} ${path}\n`;
    console.log('stdin: ', command);
    spawnedShell.stdin.cork();
    spawnedShell.stdin.write(command);
    spawnedShell.stdin.uncork();
    console.log(spawnedShell);
}

function setRubyOutput(data) {
    removeIdleAnimation();
    if (data.substring(data.length - 3) == "END") {
        data = data.substring(0, data.length - 3);
        buffer += data;
        addHTML('stdout', buffer);
        buffer = "";
    } else {
        buffer += data;
    }
}

function clearRubyOutput() {
    replaceHTML('stdout', '');
}

function showIdleAnimation() {
    if (document.getElementById("waiting")) {
        document.getElementById("waiting").style.display = "flex";
        document.getElementById("stdout").style.display = "none";
        clearRubyOutput()
    }
}

function removeIdleAnimation() {
    if (document.getElementById("waiting")) {
        document.getElementById("waiting").style.display = "none";
        document.getElementById("stdout").style.display = "block";
    }
}