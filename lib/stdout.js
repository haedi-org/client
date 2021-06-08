function setRubyOutput(command) {
    var exec = require('child_process').exec;
    exec(command, function (error, stdout, stderr) {
        console.log('stderr: ' + stderr);
        console.log('error: ' + error);
        removeIdleAnimation();
        replaceHTML('stdout', stdout);
    });
}

function runCommand(dir = 'edifact', tags = '') {
    setRubyOutput(`cd ./lib/${dir} && main.exe ${edi_path} ${tags}`);
}

const clipboardy = require('clipboardy');

function copyStdout() {
    var element = document.getElementById('stdout');
    var text = element.innerText || element.textContent;
    clipboardy.writeSync(text.replace('Copied!', ''));
    replaceText('copy-indicator', 'Copied!');
}