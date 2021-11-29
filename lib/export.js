function exportModal() {
    var modal = createModal();
    var modal_content = modal.querySelector('.modal-content');
    // Create box
    var modal_content_box = document.createElement("div");
    modal_content_box.classList.add("box");
    modal_content_box.classList.add("py-6");
    modal_content.appendChild(modal_content_box);
    // Create columns div
    var modal_content_columns = document.createElement("div");
    modal_content_columns.classList.add("columns");
    modal_content_columns.classList.add("is-vcentered");
    modal_content_box.appendChild(modal_content_columns);
    // Create individual columns
    var modal_content_column_arr = []
    for (var i = 0; i < 3; i++) {
        var modal_content_column = document.createElement("div");
        modal_content_column.classList.add("column");
        modal_content_columns.appendChild(modal_content_column);
        modal_content_column_arr.push(modal_content_column);
    }
    // Append to body
    document.body.appendChild(modal);
}