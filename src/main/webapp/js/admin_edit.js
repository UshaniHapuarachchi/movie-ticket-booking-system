// Get a reference to the input text box and the output paragraph
const inputName = document.getElementById('name');
const inputDescription = document.getElementById('description');
const inputShortDescription = document.getElementById('short_description');
const inputTime = document.getElementById('time');
const inputType = document.getElementById('type');
const inputDuration = document.getElementById('duration');
const inputPrice = document.getElementById('price');

const outputName = document.getElementById('outputName');
const outputDescription = document.getElementById('outputDescription');
const outputShortDescription = document.getElementById('outputShortDescription');
const outputTime = document.getElementById('outputTime');
const outputType = document.getElementById('outputType');
const outputDuration = document.getElementById('outputDuration');
const outputPrice = document.getElementById('outputPrice');

const servletMovieName = document.getElementById('servletMovieName');


// Add event listeners to the input text boxes
inputName.addEventListener('input', function() {
    outputName.innerHTML = inputName.value;
    servletMovieName.innerHTML = inputName.value;
});
inputDescription.addEventListener('input', function() {
    outputDescription.innerHTML = inputDescription.value;
});
inputShortDescription.addEventListener('input', function() {
    outputShortDescription.innerHTML = inputShortDescription.value;
});
inputTime.addEventListener('input', function() {
    outputTime.innerHTML = inputTime.value;
});
inputType.addEventListener('input', function() {
    outputType.innerHTML = inputType.value;
});
inputDuration.addEventListener('input', function() {
    outputDuration.innerHTML = inputDuration.value;
});
inputPrice.addEventListener('input', function() {
    outputPrice.innerHTML = inputPrice.value;
});



// // Get a reference to the input file element and the output image
const inputLarge = document.getElementById('larg_baner');
const inputSmall = document.getElementById('short_banner');

const outputLargeBanner = document.getElementById('outputLargeBanner');
const outputSmallBanner = document.getElementById('outputSmallBanner');

// Add an event listener to the input file element
inputLarge.addEventListener('change', function() {
    // Get the selected file
    const file = inputLarge.files[0];

    // Create a URL that can be used to display the image
    const url = URL.createObjectURL(file);

    // Update the src attribute of the output image
    outputLargeBanner.src = url;
});

inputSmall.addEventListener('change', function() {
    // Get the selected file
    const file = inputSmall.files[0];

    // Create a URL that can be used to display the image
    const url = URL.createObjectURL(file);

    // Update the src attribute of the output image
    outputSmallBanner.src = url;
});

function checker(){
    var result = confirm("Are you sure delete that movie?")
    if(result==false){
        event.preventDefault();
    }
}