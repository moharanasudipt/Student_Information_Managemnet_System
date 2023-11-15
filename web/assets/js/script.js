let form=document.querySelector("form");
let email = document.querySelector("#email");
let password = document.querySelector("#password");
let emailicon = document.querySelector(".emailicon");
let passicon = document.querySelector(".passicon");
let errormsg = document.querySelector("#errormsg");

let checkemail = () => {
  let pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
  if (email.value === "" || !email.value.match(pattern)) {
    emailicon.classList.add("fa-shake");
    emailicon.style.color = "#ec0909";
    return false;
  } else {
    emailicon.classList.replace("fa-envelope", "fa-circle-check");
    emailicon.classList.remove("fa-shake");
    emailicon.style.color = "#00c300";
    return true;
  }
};

let checkpassword = () => {   
  if (password.value === "") {
    passicon.classList.add("fa-shake");
    passicon.style.color = "#ec0909";
    errormsg.style.display = "inline";
    return false;
  } else {
    passicon.style.color = "#00c300";
    errormsg.style.display = "none";
    passicon.classList.remove("fa-shake");
    return true;
  }
};

email.onkeyup=checkemail;
password.onkeyup=checkpassword;

passicon.onclick = () => {
  if (password.type === "password") {
    password.setAttribute("type", "text");
    passicon.classList.replace("fa-eye-slash", "fa-eye");
  } else {
    password.setAttribute("type", "password");
    passicon.classList.replace("fa-eye", "fa-eye-slash");
  }
};
