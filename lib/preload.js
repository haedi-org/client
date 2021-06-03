window.addEventListener('DOMContentLoaded', () => {
    const replaceText = (selector, text) => {
        const element = document.getElementById(selector)
        if (element) element.innerText = text
    }

    for (const type of ['chrome', 'node', 'electron']) {
        replaceText(`${type}-version`, process.versions[type])
    }

    var exec = require('child_process').exec

    exec('cd ./edi && main.exe ./examples/edidev_desadv.edi --raw', function (error, stdout, stderr) {
    //  replaceText('stdout', stdout)
    //  console.log('stdout: ' + stdout);
        console.log('stderr: ' + stderr);
        console.log('error: ' + error);
    });
})