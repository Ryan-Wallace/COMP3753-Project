// COMP 3753 Final Project moves_script.js

// get moves when page loads
$(document).ready(function() {
    // get all moves data
    getMoves();
});

// get all moves data and insert into table rows
function getMoves() {

    // request data from server
    $.get("/api/moves", function(data)  {
        
        // build table rows from the data
        var table_rows = "";
            
        $(data).each(function(key, object) {
            // HTML table row
            table_rows += "<tr><td>" + object['Name'] + "</td><td>" + object['Category'] + "</td><td>" + object['Type'] + "</td>";
            table_rows += "<td>" + object['Power'] + "</td><td>" + object['Accuracy'] + "</td><td>" + object['PP'] + "</td></tr>";
        });
    
        // add table rows to client page
        $("#table_body").html(table_rows);
    });
}