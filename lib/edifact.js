
//var config = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));

function set_edi_path(path = null) {
    if (path == null) {
        path = document.getElementById("path-input").value;
    }
    console.log(path);
    config.paths.msg = path;
    fs.writeFileSync('./config.ini', ini.stringify(config))
    onRawBtnClick();
}

function restoreElement(id, clr, from_table = false) {
    var elements = document.getElementsByClassName(id);
    for (var i = 0; i < elements.length; i++) {
        elements[i].style.color = clr;
        elements[i].style.fontWeight = clr != config.style.default ? "bold" : "normal";
        if (from_table == elements[i].classList.contains("edi-data")) {
            elements[i].scrollIntoView({ behavior: "smooth", block: "center" });
        }
    }
}

function highlightElement(id, from_table = false) {
    restoreElement(id, config.style.highlight, from_table);
}

const rawBtn = document.getElementById('rawBtn');
rawBtn.onclick = onRawBtnClick;

const diagnosticsBtn = document.getElementById('diagnosticsBtn');
diagnosticsBtn.onclick = onDiagnosticsBtnClick;

const previewBtn = document.getElementById('previewBtn');
previewBtn.onclick = onPreviewBtnClick;

const timelineBtn = document.getElementById('timelineBtn');
timelineBtn.onclick = onTimelineBtnClick;

const testBtn = document.getElementById('testBtn');
testBtn.onclick = onTestBtnClick;

function setButtonsInactive() {
    document.getElementById("rawBtn").className = "";
    document.getElementById("diagnosticsBtn").className = "";
    document.getElementById("previewBtn").className = "";
    document.getElementById("timelineBtn").className = "";
    document.getElementById("testBtn").className = "";
}

function onRawBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("rawBtn").className = "is-active";
    runCommand('edifact', '--edicate --info', config.paths.msg);
}

function onDiagnosticsBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("diagnosticsBtn").className = "is-active";
    runCommand('edifact', '--edicate --parse', config.paths.msg);
}

function onPreviewBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("previewBtn").className = "is-active";
    runCommand('edifact', '--edicate --structure', config.paths.msg);
}

function onTimelineBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("timelineBtn").className = "is-active";
    runCommand('edifact', '--edicate --timeline', config.paths.msg);
}

function onTestBtnClick() {
    showIdleAnimation();
    setButtonsInactive();
    document.getElementById("testBtn").className = "is-active";
    runCommand('edifact', '--html-test', config.paths.msg);
}