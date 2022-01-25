const MD_DIR = '../../docs/data/md/';

function loadFile(file_path) {
    console.log('requesting', file_path);
    var result = null;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", file_path, false);
    xmlhttp.send();
    if (xmlhttp.status==200) {
        result = xmlhttp.responseText;
    }
    if (xmlhttp.status==404) {
        result = loadFile(MD_DIR + '404.md');
    }
    return result;
}


function loadMD(base_name, header = null) {
    console.log('loading', base_name)
    var file_path = MD_DIR + `${base_name}.md`;
    renderMD(file_path, header);
}