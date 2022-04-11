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

// get possible locations for a pokemon
function getFound(pokemon) {
    var api_val = "/api/found/" + pokemon;
    var html = "";

    $.ajax({
        url: api_val,
        success: function(data)  {
            html = "<table class=\"table\"><tr><th>Location</th><th>Terrain</th><th>Catch rate%</th><th>Lvl</th></tr>";

            $(data).each(function(key, object) {
                html += "<tr><td>" + object['Location'] + "</td><td>" + object['Terrain'] + "</td><td>" + object['Rate'] + "</td><td>" + object['Lvl'] + "</td></tr>";
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
            table_rows += getFound(object['Name']);

            table_rows += "</div></div></div><div class=\"col-4\"><div class=\"card\"><div class=\"card-header\">Learns:</div><div class=\"card-body\">";
            
            // get learnable moves data
            table_rows += getLearns(object['Name']);

            table_rows += "</div></div></div></div></td></tr>";
        });
    
        // add table rows to client page
        $("#table_body").html(table_rows);
    });
}

// Sort rows by table headers
function sortTable(n) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("table_body");
    switching = true;
    // Set the sorting direction to ascending:
    dir = "asc";
    /* Make a loop that will continue until
    no switching has been done: */
    while (switching) {
      // Start by saying: no switching is done:
      switching = false;
      rows = table.rows;
      /* Loop through all table rows (except the
      first, which contains table headers): */
      for (i = 0; i < (rows.length - 2); i+=2) {
        // Start by saying there should be no switching:
        shouldSwitch = false;
        /* Get the two elements you want to compare,
        one from current row and one from the next: */
        x = rows[i].getElementsByTagName("TD")[n].innerHTML;
        y = rows[i + 2].getElementsByTagName("TD")[n].innerHTML;

        console.log(x);

        if(!isNaN(x))
        {
            console.log(x);
            x = parseFloat(x);
            y = parseFloat(y);
            if (dir == "asc") {
                if (x > y) {
                    // If so, mark as a switch and break the loop:
                    shouldSwitch = true;
                    break;
                }
                } else if (dir == "desc") {
                    if (x < y) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
        }
        /* Check if the two rows should switch place,
        based on the direction, asc or desc: */
        else {
            if (dir == "asc") {
            if (x.toLowerCase() > y.toLowerCase()) {
                // If so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
            }
            } else if (dir == "desc") {
                if (x.toLowerCase() < y.toLowerCase()) {
                    // If so, mark as a switch and break the loop:
                    shouldSwitch = true;
                    break;
                }
            }
        }
      }
      if (shouldSwitch) {
        /* If a switch has been marked, make the switch
        and mark that a switch has been done: */
        rows[i].parentNode.insertBefore(rows[i + 2], rows[i]);
        rows[i].parentNode.insertBefore(rows[i + 3], rows[i+1]);
        switching = true;
        // Each time a switch is done, increase this count by 1:
        switchcount ++;
      } else {
        /* If no switching has been done AND the direction is "asc",
        set the direction to "desc" and run the while loop again. */
        if (switchcount == 0 && dir == "asc") {
          dir = "desc";
          switching = true;
        }
      }
    }
  }

