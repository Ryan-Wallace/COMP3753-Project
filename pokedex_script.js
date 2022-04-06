// COMP 3753 Final Project pokedex_script.js

// get pokemon when page loads
$(document).ready(function() {
    // get all Pokemon data
    getPokemon();
});

// get learnable moves for a pokemon
function getLearns(pokemon) {
    var api_val = "/api/learns/" + pokemon;
    var html = "";

    $.ajax({
        url: api_val,
        success: function(data)  {
            html = "<table class=\"table\"><tr><th>Move</th><th>Lvl</th></tr>";

            $(data).each(function(key, object) {
                html += "<tr><td>" + object['Move'] + "</td><td>" + object['Lvl'] + "</td></tr>";
            });
        
            html += "</table>";
        },
        async: false
    });
    return html;
}

// get all Pokemon data and insert into table rows
function getPokemon() {

    // request data from server
    $.get("/api/pokemon", function(data)  {
        
        // build table rows from the data
        var table_rows = "";
            
        $(data).each(function(key, object) {
            // HTML table row
            table_rows += "<tr><td>" + object['DexNum'] + "</td><td>" + object['Name'] + "</td><td>" + object['Category'] + "</td><td>" + object['Stage'] + "</td>";
            table_rows += "<td>" + object['Height'] + "</td><td>" + object['Weight'] + "</td><td>" + object['Ability'] + "</td>";
            table_rows += "<td>" + object['Type1'] + (object['Type2'] == "" ? "" : "/") + object['Type2'] + "</td><td>" + object['Evolution'] + "</td>";
            table_rows += "<td><button class=\"btn btn-primary\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#" + object['Name'] + "\">Info</button></td></tr>";
            table_rows += "<tr class=\"collapse\" id=\"" + object['Name'] + "\"><td colspan=\"10\"><div class=\"row\">";
            table_rows += "<div class=\"col-8\"><div class=\"card\"><div class=\"card-header\">Found:</div><div class=\"card-body\">";
            
            // get location data
            

            table_rows += "</div></div></div><div class=\"col-4\"><div class=\"card\"><div class=\"card-header\">Learns:</div><div class=\"card-body\">";
            
            // get learnable moves data
            table_rows += getLearns(object['Name']);

            table_rows += "</div></div></div></div></td></tr>";
        });
    
        // add table rows to client page
        $("#table_body").html(table_rows);
    });
}