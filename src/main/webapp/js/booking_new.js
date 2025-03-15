const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied)');
const count = document.getElementById('count');
const total = document.getElementById('total');
const moveSelect = document.getElementById('movie');

populateUI();

let ticketPrice = +moveSelect.value;

// window.addEventListener("beforeunload", function (event) {
//     localStorage.clear();
// });
//

//window.addEventListener("beforeunload", function (event) {
 //   localStorage.clear();
  //  console.log("hello")
//});
// Update total and count
function updateSelectedCount(){
    const selectedSeats = document.querySelectorAll('.row .seat.selected');

    const seatsIndex = [...selectedSeats].map(function(seat){
        return [...seats].indexOf(seat);
    });

    //Store price and seat index in localstorage


    const selectedSeatsCount = selectedSeats.length;

    count.innerText = selectedSeatsCount;
    total.innerText = selectedSeatsCount * ticketPrice;

    localStorage.setItem('selectedSeats',JSON.stringify(seatsIndex));
    localStorage.setItem('price', total.innerText);

}

// get data from db
function populateUI(){
    const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
    console.log(selectedSeats);

    if(selectedSeats !== null && selectedSeats.length > 0){
        seats.forEach((seat,index)=>{
            if(selectedSeats.indexOf(index) > -1){
                seat.classList.add('selected');
            }
        })
    }
}

// movie select event
// moveSelect.addEventListener('change',e =>{
//     ticketPrice = +e.target.value;
//     updateSelectedCount();
// })

container.addEventListener('click',(e)=>{
    if(e.target.classList.contains('seat') && !e.target.classList.contains('occupied')){
        e.target.classList.toggle('selected');
    }

    updateSelectedCount();



})

// Getting related date
const input = document.getElementById('date-picker');
const dateDiv = document.getElementById('selected-date');
input.addEventListener('change', function() {
    const date = new Date(this.value);
    const options = { day: 'numeric', month: 'long', year: 'numeric' };
    const dateString = date.toLocaleDateString('en-US', options);
    dateDiv.textContent = `${dateString}`;
    localStorage.setItem('date',dateString);
});