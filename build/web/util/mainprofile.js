const save = document.getElementById('save-button');
const cancel = document.getElementById('cancel-button');
const edit = document.getElementById('edit-button');

edit.addEventListener('click', (e) => {
    e.preventDefault();
    save.classList.remove("hide");
    cancel.classList.remove("hide");
    edit.classList.add("hide");
    unlock();
});

save.addEventListener('click', (e) => {
    save.classList.add("hide");
    cancel.classList.add("hide");
    edit.classList.remove("hide");
});

cancel.addEventListener('click', (e) => {
    e.preventDefault();
    save.classList.add("hide");
    cancel.classList.add("hide");
    edit.classList.remove("hide");
    clear();
    lock();
});




const emailin = document.getElementById("email");
const phonein = document.getElementById("phone");
const addressin = document.getElementById("address");
const namein = document.getElementById("fullname");
const passin = document.getElementById("pass");
//const cfpassin = document.getElementById("cfpass");
function refill(email, phone, address, name, pass) {
    emailin.value = email;
    phonein.value = phone;
    addressin.value = address;
    namein.value = name;
    passin.value = pass;
//    cfpassin.value = pass;
}
function clear() {
    emailin.value = '';
    phonein.value = '';
    addressin.value = '';
    namein.value = '';
    passin.value = '';
//    cfpassin.value = '';
}
function unlock() {
    emailin.disabled = false;
    phonein.disabled = false;
    addressin.disabled = false;
    namein.disabled = false;
    passin.disabled = false;
//    cfpassin.disabled = false;
}
function lock() {
    emailin.disabled = true;
    phonein.disabled = true;
    addressin.disabled = true;
    namein.disabled = true;
    passin.disabled = true;
//    cfpassin.disabled = true;
}

function warning() {
    let confirm = confirm("Do you want to log out?");
    if (confirm) {
        window.location.href = "/logout";
    }
}

