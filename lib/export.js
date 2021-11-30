function exportModal() {
    var modal = createModal("420px");
    var modal_content = modal.querySelector('.modal-content');
    // Create box
    var modal_content_box = document.createElement("div");
    modal_content_box.classList.add("box");
    modal_content_box.classList.add("p-5");
    modal_content.appendChild(modal_content_box);
//  // Create title
//  var modal_title = document.createElement("p");
//  modal_title.innerText = "Select an export format:";
//  modal_title.classList.add("has-text-centered");
//  modal_title.classList.add("mb-4");
//  modal_content_box.appendChild(modal_title);
    // Create columns div
    var modal_content_columns = document.createElement("div");
    modal_content_columns.classList.add("columns");
    modal_content_columns.classList.add("is-centered");
    modal_content_columns.classList.add("has-text-centered");
    modal_content_box.appendChild(modal_content_columns);
    // Create individual columns
    var modal_content_column_arr = []
    for (var i = 0; i < 3; i++) {
        var modal_content_column = document.createElement("div");
        modal_content_column.classList.add("column");
        modal_content_column.classList.add("no-border");
        modal_content_columns.appendChild(modal_content_column);
        modal_content_column_arr.push(modal_content_column);
    }
    // Add XML button
    var xml_icon = document.createElement("div");
    xml_icon.classList.add("round-icon-button");
    xml_icon.classList.add("my-4");
    var xml_icon_image = document.createElement("img");
    xml_icon_image.setAttribute('src', '../assets/icons/xml_file.svg');
    xml_icon.appendChild(xml_icon_image);
    modal_content_column_arr[0].appendChild(xml_icon);
    // Add JSON button
    var json_icon = document.createElement("div");
    json_icon.classList.add("round-icon-button");
    json_icon.classList.add("my-4");
    var json_icon_image = document.createElement("img");
    json_icon_image.setAttribute('src', '../assets/icons/json_file.svg');
    json_icon.appendChild(json_icon_image);
    modal_content_column_arr[1].appendChild(json_icon);
    // Add EDI button
    var edi_icon = document.createElement("div");
    edi_icon.classList.add("round-icon-button");
    edi_icon.classList.add("my-4");
    var edi_icon_image = document.createElement("img");
    edi_icon_image.setAttribute('src', '../assets/icons/edi_file.svg');
    edi_icon.appendChild(edi_icon_image);
    modal_content_column_arr[2].appendChild(edi_icon);
    // Add X12 button
    var x12_icon = document.createElement("div");
    x12_icon.classList.add("round-icon-button");
    x12_icon.classList.add("my-4");
    x12_icon.classList.add("mt-5");
    var x12_icon_image = document.createElement("img");
    x12_icon_image.setAttribute('src', '../assets/icons/x12_file.svg');
    x12_icon.appendChild(x12_icon_image);
    modal_content_column_arr[0].appendChild(x12_icon);
    // Add code button
    var code_icon = document.createElement("div");
    code_icon.classList.add("round-icon-button");
    code_icon.classList.add("my-4");
    code_icon.classList.add("mt-5");
    var code_icon_image = document.createElement("img");
    code_icon_image.setAttribute('src', '../assets/icons/code_file.svg');
    code_icon.appendChild(code_icon_image);
    modal_content_column_arr[1].appendChild(code_icon);
    // Append to body
    document.body.appendChild(modal);
}