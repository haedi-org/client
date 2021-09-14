const { readFile } = require("fs");

var appName = '';
var version = '';
// Send for information
ipcRenderer.send('get-app-info', 'name');
ipcRenderer.send('get-app-info', 'version');
// Receive information
ipcRenderer.on('receive-app-name', function (ev, payload) {
    appName = payload;
});

ipcRenderer.on('receive-app-version', function (ev, payload) {
    version = payload;
});

function hideModals() {
    // For all objects of class modal
    var modals = document.getElementsByClassName("modal");
    for (var i = 0; i < modals.length; i++) {
        // Remove the 'is-active' tag
        modals[i].classList.remove("is-active");
    }
}

function exampleModal() {
    var header_text = '<h1>Hello world!</h1>';
    var paragraph_text = '<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>';
    var image_path = '../assets/sitting_computer_sketch.jpg';
    var icon_path = '../assets/sparkle_multi.svg';
    addModal(header_text, paragraph_text, image_path, icon_path);
}

function aboutModal() {
    //var header_text = `<p class="title is-3">${appName}</p>`
    var header_text = `<img id="logo" class="pl-0 ml-0" src="../assets/glisten.svg">`;
    header_text += `<p class="subtitle is-5">${version} ( in early development )</p>`;
    var paragraph_text = `<br><p class="title is-6 pt-2 mb-2">Contributors:</p>`
    readFile("./contributors.csv", "utf8", (error, text_content) => {
        if(error) { throw error }
        for(let row of text_content.split("\n")){
            const row_items = row.split(",");
            console.log(row_items);
            var contributor_name = row_items[0];
            var contributor_title = row_items[1];
            var contributor_handle = row_items[2];
            var contributor_image = row_items[3];
            paragraph_text += `<div class="columns my-0 mt-0 pt-0"><div class="column is-narrow" style="border: none">`
            paragraph_text += `<figure class="image is-48x48 px-0 mx-0"><img class="is-rounded" src="${contributor_image}"></figure>`
            paragraph_text += `</div><div class="column px-0" style="border: none">`
            paragraph_text += `<p class="subtitle is-5 mb-0">${contributor_name} <b style="font-weight: normal; font-size: 0.8em">${contributor_handle}</b></p>`;
            paragraph_text += `<p class="mt-0">${contributor_title}</p>`;
            paragraph_text += `</div></div>`;
            //paragraph_text += `<div class="card is-small block"><div class="card-content"><div class="media"><div class="media-left"><figure class="image is-48x48 px-0 mx-0"><img src="${contributor_image}"></figure></div><div class="media-content"><p class="title is-5">${contributor_name}<b style="padding-left: 8px; font-size: 0.8em; font-weight: normal">${contributor_handle}</b></p><p class="subtitle is-6">${contributor_title}</p></div></div></div></div>`
        }
        var image_path = '../assets/standing_whiteboard_sketch.jpg';
        //var icon_path = '../assets/sparkle_multi.svg';
        addModal(header_text, paragraph_text, image_path, '');
    });
}

function addModal(header_text, paragraph_text, image_path = '../assets/sitting_computer_sketch.jpg', icon_path = '../assets/sparkle_multi.svg', width = "640px") {
    // Create modal div
    var modal = document.createElement("div");
    modal.classList.add("modal");
    modal.classList.add("is-active");
    document.body.appendChild(modal);
    // Create modal background div
    var modal_background = document.createElement("div");
    modal_background.classList.add("modal-background");
    modal.appendChild(modal_background);
    // Create modal content
    var modal_content = document.createElement("div");
    modal_content.classList.add("modal-content");
    modal_content.style.width = width;
    modal.appendChild(modal_content);
    // Create box
    var modal_content_box = document.createElement("div");
    modal_content_box.classList.add("box");
    modal_content_box.classList.add("py-6");
    modal_content.appendChild(modal_content_box);
    // Create columns
    var modal_content_columns = document.createElement("div");
    modal_content_columns.classList.add("columns");
    modal_content_columns.classList.add("is-vcentered");
    modal_content_box.appendChild(modal_content_columns);
    // Create left column
    var modal_content_left_column = document.createElement("div");
    modal_content_left_column.classList.add("column");
    modal_content_left_column.classList.add("is-narrow");
    modal_content_left_column.style.border = "none";
    modal_content_columns.appendChild(modal_content_left_column);
    // Create figure
    var modal_content_figure = document.createElement("figure");
    modal_content_figure.classList.add("image");
    modal_content_figure.classList.add("is-256x256");
    modal_content_left_column.appendChild(modal_content_figure);
    // Create figure image
    var modal_content_figure_image = document.createElement("img");
    modal_content_figure_image.setAttribute('src', image_path);
    modal_content_figure.appendChild(modal_content_figure_image);
    // Create right column
    var modal_content_right_column = document.createElement("div");
    modal_content_right_column.classList.add("column");
    modal_content_right_column.style.border = "none";
    modal_content_columns.appendChild(modal_content_right_column);
    // Create content
    var modal_content_content = document.createElement("div");
    modal_content_content.classList.add("content");
    modal_content_right_column.appendChild(modal_content_content);
    // Create icon text span
    var modal_content_icon_text = document.createElement("span");
    modal_content_icon_text.classList.add("icon-text");
    modal_content_content.appendChild(modal_content_icon_text);
    // Create header span
    var modal_content_header_span = document.createElement("span");
    modal_content_icon_text.appendChild(modal_content_header_span);
    // Create header
    var modal_content_header = document.createElement("div");
    modal_content_header.innerHTML = header_text;
    modal_content_header_span.appendChild(modal_content_header);
    // Create header icon span
    var modal_content_header_icon_span = document.createElement("span");
    modal_content_header_icon_span.classList.add("icon");
    modal_content_header_icon_span.classList.add("is-medium");
    modal_content_header_icon_span.classList.add("ml-4");
    modal_content_icon_text.appendChild(modal_content_header_icon_span);
    // Create header icon
    var modal_content_header_icon = document.createElement("img");
    modal_content_header_icon.setAttribute('src', icon_path);
    modal_content_header_icon_span.appendChild(modal_content_header_icon);
    // Create paragraph
    var modal_content_paragraph = document.createElement("div");
    modal_content_paragraph.innerHTML = paragraph_text;
    modal_content_content.appendChild(modal_content_paragraph);
    // Create button
    var modal_button = document.createElement("button");
    modal_button.classList.add("modal-close");
    modal_button.classList.add("is-large");
    modal_button.classList.add("mt-5");
    modal_button.setAttribute("aria-label", "close");
    modal_button.setAttribute("onclick", "hideModals()");
    modal.appendChild(modal_button);
}

// <div class="modal is-active">
//     <div class="modal-background"></div>
//     <div class="modal-content">
//         <div class="box">
//             <div class="columns is-vcentered">
//                 <div class="column" style="border: none">
//                     <figure class="image is-256x256">
//                         <img src="../assets/sitting_computer_sketch.jpg">
//                     </figure>
//                 </div>
//                 <div class="column" style="border: none">
//                     <div class="content">
//                         <span class="icon-text">
//                             <span><h1>Hello world!</h1></span>
//                             <span class="icon is-medium ml-4"><img src="../assets/sparkle_multi.svg"></span>
//                         </span>
//                         <p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
//                     </div>
//                 </div>
//             </div>
//         </div>
//     </div>
//     <button class="modal-close is-large mt-5" aria-label="close" onclick="hideModals()"></button>
// </div>