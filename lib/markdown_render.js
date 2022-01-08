var showdown  = require('showdown')

function renderMD(file_path, header = null) {
    var element = document.getElementById("markdown-content");
    var contents = loadFile(file_path);
    var converter = new showdown.Converter();
    converter.setOption('emojis', true);
    converter.setOption('tables', true);
    converter.setOption('tasklists', true);
    element.innerHTML = converter.makeHtml(contents);
    if (header != null) {
        console.log('scroll_to', header);
        scrollToTargetAdjusted(header);
    } else {
        //console.log('scroll_to', 'top');
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    }
}

function scrollToTargetAdjusted(id){
    var element = document.getElementById(id);
    if (element != null) {
        var headerOffset = 64;
        var elementPosition = element.getBoundingClientRect().top;
        var offsetPosition = elementPosition - headerOffset;
        window.scrollTo({
            top: offsetPosition,
            behavior: "smooth"
        });
    } else {
        loadMD('404')
    }
}