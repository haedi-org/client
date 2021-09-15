var workspace_columns = 4;

function createAddWorkspaceButton(index = 0) {
    var column_id = `column-${index % workspace_columns}`;
    var parent = document.getElementById(column_id);
    var div = document.createElement("div");
    div.classList.add("option-cell");
    div.classList.add("content");
    div.classList.add("box");
    var text = document.createElement("h2");
    text.classList.add("subtitle");
    text.classList.add("is-6");
    text.classList.add("m-0");
    text.innerText = "New Workspace";
    div.appendChild(text);
    parent.appendChild(div);
}

function openWorkspace(id = "") {
    const { ipcRenderer } = require('electron');
    ipcRenderer.send('open-page', 'html/index.html');
}

function createWorkspaceLink(index, id, type, ribbon_class = "is-primary") {
    var column_id = `column-${index % workspace_columns}`;
    var parent = document.getElementById(column_id);
    var div = document.createElement("div");
    div.classList.add("option-cell");
    div.classList.add("content");
    div.classList.add("box");
    div.classList.add("has-ribbon");
    div.setAttribute("onclick", `openWorkspace()`);
    var text = document.createElement("h2");
    text.classList.add("subtitle");
    text.classList.add("is-6");
    text.classList.add("m-0");
    text.innerText = id;
    div.appendChild(text);
    var ribbon = document.createElement("div");
    ribbon.classList.add("ribbon");
    ribbon.classList.add("is-outlined");
    ribbon.classList.add(ribbon_class);
    ribbon.innerText = type;
    div.appendChild(ribbon);
    parent.appendChild(div);
}

function addOptionGridColumns() {
    var parent = document.getElementById("option-grid");
    for (var index = 0; index < workspace_columns; index++) {
        var div = document.createElement("div");
        div.id = `column-${index}`;
        div.classList.add("column");
        parent.appendChild(div);
    }
}

addOptionGridColumns();
createAddWorkspaceButton();

createWorkspaceLink(1, "Sample files", "System", "is-default");
createWorkspaceLink(2, "Amazon", "Live");
createWorkspaceLink(3, "Amazon Demo", "Staging", "is-warning");
createWorkspaceLink(4, "DHL eCommerce", "Live");
createWorkspaceLink(5, "Synergy 3PL", "Live");