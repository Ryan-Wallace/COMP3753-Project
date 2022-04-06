// COMP 3753 Final Project locations_script.js

// get pokemon when page loads
$(document).ready(function() {
    // get all Pokemon data
    getLocations();
});

// get learnable moves for a pokemon
function getPokemonHere(location) {
    var api_val = "/api/pokemon/" + location;
    var html = "";

    $.ajax({
        url: api_val,
        success: function(data)  {
            html = "<table class=\"table\"><tr><th>Pokemon</th><th>Terrain</th><th>Rate</th><th>Lvl</th></tr>";

            $(data).each(function(key, object) {
                html += "<tr><td>" + object['Pokemon'] + "</td><td>" + object['Terrain'] + "</td><td>" + object['Rate'] + "</td><td>" + object['Lvl'] + "</td></tr>";
            });
        
            html += "</table>";
        },
        async: false
    });
    return html;
}

// get all Pokemon data and insert into table rows
function getLocations() {

    // request data from server
    $.get("/api/location", function(data)  {
        
        // build table rows from the data
        var table_rows = "";
            
        $(data).each(function(key, object) {
            // HTML table row
            table_rows += "<tr><td>" + object['Name'] + "</td><td>" + object['Region'] + "</td><td>" + object['Climate'] + "</td>";
            table_rows += "<td><button class=\"btn btn-primary\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#" + object['Name'].replace(/\s/g,'') + "\">Info</button></td></tr>";
            table_rows += "<tr class=\"collapse\" id=\"" + object['Name'].replace(/\s/g,'') + "\"><td colspan=\"10\"><div class=\"row\">";
            table_rows += "<div class=\"col-12\"><div class=\"card\"><div class=\"card-header\">Found:</div><div class=\"card-body\">";
            
            // get location data
            table_rows += getPokemonHere(object['Name']);

            table_rows += "</div></div></div></div></td></tr>";
        });
    
        // add table rows to client page
        $("#table_body").html(table_rows);
    });
}