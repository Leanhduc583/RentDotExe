// Switch Animation
const container = document.getElementById('login-container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});





// Register Validation
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('mainForm');
    const fullname = document.getElementById('fullname');
    const username = document.getElementById('username');
    const password = document.getElementById('password');
    const conpassword = document.getElementById('cpassword');

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        if (checkInputs()) {
            showModal();
        }
    });

    fullname.addEventListener('input', () => {
        validateField(fullname, fullname.value.trim() !== '', 'Full name cannot be blank');
    });

    username.addEventListener('input', () => {
        validateField(username, username.value.trim() !== '', 'Username cannot be blank');
    });

    password.addEventListener('input', () => {
        validateField(password, password.value.trim().length >= 5, 'Password must be at least 5 characters');
    });

    conpassword.addEventListener('input', () => {
        validateField(conpassword, password.value === conpassword.value, 'Password did not match');
    });

    function checkInputs() {
        let isValid = true;
        validateField(fullname, fullname.value.trim() !== '', 'Full name cannot be blank');
        validateField(username, fullname.value.trim() !== '', 'Username cannot be blank');
        validateField(password, password.value.trim().length >= 5, 'Password must be at least 5 characters');
        validateField(conpassword, password.value === conpassword.value && conpassword.value !== '', 'Password did not match');
        document.querySelectorAll('.form-control').forEach((control) => {
            if (control.classList.contains('error')) {
                isValid = false;
            }
        });
        return isValid;
    }

    function validateField(input, condition, errorMessage) {
        if (condition) {
            setSuccess(input);
        } else {
            setError(input, errorMessage);
        }
    }


    function setError(input, message) {
        const formControl = input.parentElement;
        formControl.className = 'form-control error';
        input.placeholder = message;
    }

    function setSuccess(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-control success';
    }

    function showModal() {
        window.location.href = `./signup?fullname=${fullname.value}&username=${username.value}&password=${password.value}`;
    }
});


