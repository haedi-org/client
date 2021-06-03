var exec = require('child_process').exec;
const execSync = require('child_process').execSync;

var edi_path = './samples/DESADV_D01B_ecosio.edi';

function set_edi_path() {
    var path = document.getElementById("path-input").value;
    console.log(path);
    edi_path = path;
    onRawBtnClick();
}

function basename(path) {
    return path.split('\\').reverse()[0];
}

function onFileBtnClick() {
    var path = document.getElementById("fileBtn").files[0].path;
    document.getElementById("file-name").innerText = basename(path);
    edi_path = path;
    runCommand();
    console.log(path);
}

function setRubyOutput(command) {
    exec(command, function (error, stdout, stderr) {
        console.log('stderr: ' + stderr);
        console.log('error: ' + error);
        removeIdleAnimation();
        replaceHTML('stdout', stdout);
    });
}

function runCommand(tags = '') {
    setRubyOutput(`cd ./lib/edifact && main.exe ${edi_path} ${tags}`);
}

const replaceText = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerText = text
}

const replaceHTML = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerHTML = text
}

const rawBtn = document.getElementById('rawBtn');
rawBtn.onclick = onRawBtnClick;

const diagnosticsBtn = document.getElementById('diagnosticsBtn');
diagnosticsBtn.onclick = onDiagnosticsBtnClick;

const previewBtn = document.getElementById('previewBtn');
previewBtn.onclick = onPreviewBtnClick;

const timelineBtn = document.getElementById('timelineBtn');
timelineBtn.onclick = onTimelineBtnClick;

function setButtonsInactive() {
    document.getElementById("rawBtn").className = "";
    document.getElementById("diagnosticsBtn").className = "";
    document.getElementById("previewBtn").className = "";
    document.getElementById("timelineBtn").className = "";
}

function showIdleAnimation() {
    document.getElementById("waiting").style.display = "flex";
    document.getElementById("stdout").style.display = "none";
}

function removeIdleAnimation() {
    document.getElementById("waiting").style.display = "none";
    document.getElementById("stdout").style.display = "block";
}

function onRawBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#F5F5F5";
    document.getElementById("rawBtn").className = "is-active";
    runCommand('--html');
}

function onDiagnosticsBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#FFFFFF";
    document.getElementById("diagnosticsBtn").className = "is-active";
    runCommand('--refs');
}

function onPreviewBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#FFFFFF";
    document.getElementById("previewBtn").className = "is-active";
    runCommand('--structure');
}

function onTimelineBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#FFFFFF";
    document.getElementById("timelineBtn").className = "is-active";
    runCommand('--timeline');
}

const clipboardy = require('clipboardy');

function copyStdout() {
    var element = document.getElementById('stdout');
    var text = element.innerText || element.textContent;
    clipboardy.writeSync(text.replace('Copied!', ''));
    replaceText('copy-indicator', 'Copied!');
}

const customTitlebar = require('custom-electron-titlebar');

new customTitlebar.Titlebar({
    backgroundColor: customTitlebar.Color.fromHex('#FFFFFF'),
    menu: null
})

function openBrowser(url) {
    execSync(`start ${url}`)
}