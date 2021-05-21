var exec = require('child_process').exec

//var edi_path = './examples/kingfisher_store-replen-order.edi';
//var edi_path = './examples/babelway.edi';
//var edi_path = './examples/edidev_desadv.edi';
//var edi_path = '..\\..\\machin-dev\\edi\\samples\\INVRPT_D01B_gs1_ref.edi';
var edi_path = './samples/INVRPT_D13A_continental_ref.edi';

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
    setRubyOutput(`cd ./edi && main.exe ${edi_path} ${tags}`);
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

function removeIdleAnimation() {
    document.getElementById("waiting").style.display = "none";
    document.getElementById("stdout").style.display = "block";
}

function showIdleAnimation() {
    document.getElementById("waiting").style.display = "flex";
    document.getElementById("stdout").style.display = "none";
}

function onRawBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#F5F5F5";
    document.getElementById("rawBtn").className = "is-active";
    runCommand('--raw');
}

function onDiagnosticsBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#FFFFFF";
    document.getElementById("diagnosticsBtn").className = "is-active";
    runCommand('--html');
}

function onPreviewBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#FFFFFF";
    document.getElementById("previewBtn").className = "is-active";
    runCommand('--debug');
}

function onTimelineBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("stdout").style.backgroundColor = "#FFFFFF";
    document.getElementById("timelineBtn").className = "is-active";
    runCommand('--highlighted');
}

const customTitlebar = require('custom-electron-titlebar');

new customTitlebar.Titlebar({
    backgroundColor: customTitlebar.Color.fromHex('#FFF'),
    menu: null
})