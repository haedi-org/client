function hideModals() {
    // For all objects of class modal
    var modals = document.getElementsByClassName("modal");
    for (var i = 0; i < modals.length; i++) {
        // Remove the 'is-active' tag
        modals[i].classList.remove("is-active");
    }
}

function exampleModal() {
    var header_text = 'Hello world!';
    var paragraph_text = 'Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!';
    var image_path = '../assets/sitting_computer_sketch.jpg';
    var icon_path = '../assets/sparkle_multi.svg';
    addModal(header_text, paragraph_text, image_path, icon_path);
}

function addModal(header_text, paragraph_text, image_path = '../assets/sitting_computer_sketch.jpg', icon_path = '../assets/sparkle_multi.svg') {
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
    modal.appendChild(modal_content);
    // Create box
    var modal_content_box = document.createElement("div");
    modal_content_box.classList.add("box");
    modal_content.appendChild(modal_content_box);
    // Create columns
    var modal_content_columns = document.createElement("div");
    modal_content_columns.classList.add("columns");
    modal_content_columns.classList.add("is-vcentered");
    modal_content_box.appendChild(modal_content_columns);
    // Create left column
    var modal_content_left_column = document.createElement("div");
    modal_content_left_column.classList.add("column");
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
    var modal_content_header = document.createElement("h1");
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
    var modal_content_paragraph = document.createElement("p");
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