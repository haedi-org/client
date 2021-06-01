const edifactBtn = document.getElementById('edifactBtn');

edifactBtn.onclick = onEdifactBtnClick;

function onEdifactBtnClick() {
    document.location.href = './inspect.html';
}

const customTitlebar = require('custom-electron-titlebar');

new customTitlebar.Titlebar({
    backgroundColor: customTitlebar.Color.fromHex('#FFFFFF'),
    menu: null
})
