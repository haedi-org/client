function basename(path) {
    return path.split('\\').reverse()[0];
}

const replaceText = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerText = text
}

const replaceHTML = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerHTML = text
}

const addHTML = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerHTML += text
}