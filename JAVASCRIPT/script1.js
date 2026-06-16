function greet() {
    document.getElementById("result").innerHTML = "Welcome to JS";
}

document.getElementById("clickhere").addEventListener("click", greet);


function disp() {
    document.getElementById("result").innerHTML = "Button Clicked"
}