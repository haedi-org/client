function setRubyOutput(command) {
    var exec = require('child_process').exec;
    exec(command, function (error, stdout, stderr) {
        console.log('stderr: ' + stderr);
        console.log('error: ' + error);
        removeIdleAnimation();
        replaceHTML('stdout', stdout);
    });
}

function runCommand(dir = 'edifact', tags = '', path = '') {
    setRubyOutput(`cd ./lib/${dir} && main.exe ${tags} ${path}`);
}

const clipboardy = require('clipboardy');

function copyStdout() {
    var element = document.getElementById('stdout');
    var text = element.innerText || element.textContent;
    clipboardy.writeSync(text.replace('Copied!', ''));
    replaceText('copy-indicator', 'Copied!');
}

function showIdleAnimation() {
    if (document.getElementById("waiting")) {
        document.getElementById("waiting").style.display = "flex";
        document.getElementById("stdout").style.display = "none";
    }
}

function removeIdleAnimation() {
    if (document.getElementById("waiting")) {
        document.getElementById("waiting").style.display = "none";
        document.getElementById("stdout").style.display = "block";
    }
}