const fs = require('fs')
const ini = require('ini')
const { ipcRenderer } = require('electron')

const config = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));

var cli_arguments = ['--headless', '--edicate'];

var spawnedShell = require('child_process').spawn(
    config.executables.cli, 
    cli_arguments, 
    { cwd: config.paths.cli }
);

var shells = [spawnedShell];

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
    console.log('stdin: ', path);
    spawnedShell.stdin.cork();
    spawnedShell.stdin.write(`${tags} ${path}\n`);
    spawnedShell.stdin.uncork();
    console.log(spawnedShell);
}

function setRubyOutput(data) {
    removeIdleAnimation();
    addHTML('stdout', data);
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