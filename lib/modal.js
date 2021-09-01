function hideModals() {
    // For all objects of class modal
    var modals = document.getElementsByClassName("modal");
    for (var i = 0; i < modals.length; i++) {
        // Remove the 'is-active' tag
        modals[i].classList.remove("is-active");
    }
}

function addModal() {

}