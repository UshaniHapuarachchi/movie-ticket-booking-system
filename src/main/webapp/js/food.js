window.addEventListener("beforeunload", function (event) {
    localStorage.clear();
});

var price = localStorage.getItem('price');
console.log(localStorage.getItem('total'))
document.getElementById('priceData').innerHTML = price;
document.getElementById('priceDataFrom').value = price;


var selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
document.getElementById('selectedSeatsData').innerHTML = selectedSeats;
document.getElementById('setasDataForm').value = selectedSeats;
