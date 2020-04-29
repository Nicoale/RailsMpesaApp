function phone_number(number){
    const regex=/\d+[0-9];
    return regex.test(number);
}

document.addEventListener("DOMContentLoaded",e=>{
    const phone_number=document.querySelector("input[data-validate-phone]")});
    phone_number.addEventListener