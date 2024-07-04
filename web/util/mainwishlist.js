function warning() {
    let confirm = confirm("Do you want to log out?");
    if (confirm) {
        window.location.href = "/logout";
    }
}