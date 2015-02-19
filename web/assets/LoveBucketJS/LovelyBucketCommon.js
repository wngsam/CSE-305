function search(form){
    var search=form;
    search.method= 'post';
    search.action='./search';
    System.out.print("search");
    search.submit;
}
function signUp(password, cpassword, email, cemail, form){
    var signup = form;
    if(email.value === ""){
        document.getElementById("errEmail").innerHTML = "Email cannot be blank";
        return;
    }
    if(password.value === ""){
        document.getElementById("errPass").innerHTML = "Password cannot be blank";
		return;
    }
    if(password.value !== cpassword.value){
        document.getElementById("errPass").innerHTML = "Passwords do not match"; 
        return;
    }
    if(email.value !== cemail.value){
        document.getElementById("errEmail").innerHTML = "Emails do not match"; 
        return;
    }
    signup.method = 'post';
    signup.action = './signup';
    signup.submit();
}
