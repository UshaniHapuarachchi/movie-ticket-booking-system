// SIDEBAR TOGGLE
var sidebarOpen = false;
var sidebar = document.getElementById("sidebar");

function openSidebar(){
    if(!sidebarOpen){
        sidebar.classList.add("sidebar-responsive");
        sidebarOpen = true;
    }
}

function closeSidebar(){
    if(sidebarOpen){
        sidebar.classList.remove("sidebar-responsive");
        sidebarOpen = false;
    }
}
document.addEventListener("DOMContentLoaded",()=>{
    document.querySelectorAll(".search-input").forEach(inputField=>{
        const tableRow = inputField.closest("table").querySelectorAll("tbody tr");
        const headerCell = inputField.closest("th");
        const otherHeaderCells = inputField.closest("tr").querySelectorAll("th");
        const columnIndex = Array.from(otherHeaderCells).indexOf(headerCell);
        const searchbleCells = Array.from(tableRow)
            .map(row => row.querySelectorAll("td")[columnIndex]);

        inputField.addEventListener("input", ()=>{
            const searchQuery  = inputField.ariaValueMax.toLowerCase();

            for(const tableCell of searchbleCells){
                const row = tableCell.closest("tr");
                const value = tableCell.textContent
                    .toLowerCase()
                    .replace(",","");
                row.style.visibility = null;
                if(value.search(searchQuery)===-1){
                    row.style.visibility = "collapse";
                }
            }
        })

    })

});

function checker(){
    var result = confirm("Are you sure delete this movie?")
    if(result==false){
        event.preventDefault();
    }
}

// function toggle(){
//     var blur = document.getElementById("blur");
//     blur.classList.toggle('active');
// }