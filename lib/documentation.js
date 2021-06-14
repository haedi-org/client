function associateButtons() {
    const allBtn = document.getElementById('allBtn');
    allBtn.onclick = onAllBtnClick;
    const publicBtn = document.getElementById('publicBtn');
    publicBtn.onclick = onPublicBtnClick;
    const privateBtn = document.getElementById('privateBtn');
    privateBtn.onclick = onPrivateBtnClick;
}

function onAllBtnClick() {
    showIdleAnimation();
    runCommand('documentation', '--all');
}

function onPublicBtnClick() {
    showIdleAnimation();
    runCommand('documentation', '--public');
}

function onPrivateBtnClick() {
    showIdleAnimation();
    runCommand('documentation', '--private');
}

associateButtons();