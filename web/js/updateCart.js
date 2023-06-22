var quantity = document.getElementsByClassName("quantity");
var change = document.getElementsByClassName("change");
var pid = document.getElementsByClassName("pid");
var newA;
var newurl = "MainController?action=updateCart&pid=" + pid.value + "&newquantity=" + quantity.value;
function changeQuantity() {
    for (let i = 0; i < quantity.length; i++) {
        console.log(quantity[i].value);
        console.log(pid[i].value);
    }


    newA = quantity.value;
    console.log("MainController?action=updateCart&pid=" + pid.value + "&newquantity=" + newA);

}
//    MainController?action=updateCart&pid=
for (let i = 0; i < change.length; i++) {
    change[i].addEventListener('click', function () {
        var clickedIndex = Array.prototype.indexOf.call(change, this);
        change[clickedIndex].href = "MainController?action=updateCart&pid=" + pid[clickedIndex].value + "&newquantity=" + quantity[clickedIndex].value;
    });
}