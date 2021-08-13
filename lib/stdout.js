const fs = require('fs')
const ini = require('ini')

const config = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));

var cli_arguments = ['--headless', '--edicate', '--parse'];

var spawnedShell = require('child_process').spawn(
    config.executables.cli, 
    cli_arguments, 
    {cwd: config.paths.cli}
);

spawnedShell.stdout.on('data', function (data) {
    console.log('stdout: ', data.toString());
    setRubyOutput(data.toString());
});
  
spawnedShell.stderr.on('data', function (data) {
    console.log('stderr: ', data.toString());
    setRubyOutput('ERR');
});

function runCommand(dir = 'edifact', tags = '', path = '') {
    console.log('stdin: ', path);
    spawnedShell.stdin.cork();
    spawnedShell.stdin.write(`${path}\n`);
    spawnedShell.stdin.uncork();
    //spawnedShell.stdin.end();
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