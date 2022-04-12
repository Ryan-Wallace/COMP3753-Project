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
            html = "<table class=\"table\"><tr><th>Location</th><th>Terrain</th><th>Appearance rate %</th><th>Lvl</th></tr>";

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
        var count = 0;
            
        $(data).each(function(key, object) {
            // HTML table row
            count++;
            table_rows += "<tr><td>" + object['DexNum'] + "</td><td>" + object['Name'] + "</td><td>" + object['Category'] + "</td><td>" + object['Stage'] + "</td>";
            table_rows += "<td>" + object['Height'] + "</td><td>" + object['Weight'] + "</td><td>" + object['Ability'] + "</td>";
            table_rows += "<td>" + object['Type1'] + (object['Type2'] == "" ? "" : "/") + object['Type2'] + "</td><td>" + object['Evolution'] + "</td>";
            table_rows += "<td><button class=\"btn btn-primary\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#" + object['Name'] + "\">Info</button></td></tr>";

            table_rows += "<tr class=\"collapse\" id=\"" + object['Name'] + "\">"

            table_rows += "<td colspan=\"10\">";
            table_rows += "<p id =\"" + object['DexNum'] + "P\"></p>";
            table_rows += "<div class=\"row\"><div class=\"col-8\"><div class=\"card\"><div class=\"card-header\">Found:</div><div class=\"card-body\">";
            
            // get location data
            table_rows += getFound(object['Name']);

            table_rows += "</div></div></div><div class=\"col-4\"><div class=\"card\"><div class=\"card-header\">Learns:</div><div class=\"card-body\">";
            
            // get learnable moves data
            table_rows += getLearns(object['Name']);
            

            table_rows += "</div></div></div></div></td></tr>";
        });
    
        // add table rows to client page
        $("#table_body").html(table_rows);
        for(i = 1; i <= count; i++) {
            getTypes(i);
        }
    });
}

//Creates and returns an unordered list (html) of weaknesses, resistances, and immunities
//for pokemon with dex number dexNum. (parse dexNum to int when calling)
function getTypes(dexNum) {
    var type1, type2 = "", r1, r2, w1, w2, i1, i2, weaknesses, resistances, immunities;
    var html = "";

    var getObjectByValue = function (array, key, value) {
        return array.filter(function (object) {
            return object[key] === value;
        });
    };
    
    $.get("/api/pokemon", function(pkList)  {
        type1 = pkList[dexNum -1]['Type1'];

        if(pkList[dexNum -1]['Type2'] != "") {
            type2 = pkList[dexNum -1]['Type2'];
        }

        $.get("/api/types", function(types) {
            w1 = getObjectByValue(types, "Type", type1);
            w1 = new Set(w1[0]["Weaknesses"].split(','));

            r1 = getObjectByValue(types, "Type", type1);
            r1 = new Set(r1[0]["Resistances"].split(','));

            i1 = getObjectByValue(types, "Type", type1);
            if(i1[0]["Immunities"] != null) {
                i1 = new Set(i1[0]["Immunities"].split(','));
            }
            else {
                i1 = new Set();
            }


            if(type2 != "") {
                w2 = getObjectByValue(types, "Type", type2);
                w2 = new Set(w2[0]["Weaknesses"].split(','));
            
                r2 = getObjectByValue(types, "Type", type2);
                r2 = new Set(r2[0]["Resistances"].split(','));

                i2 = getObjectByValue(types, "Type", type2);
                if(i2[0]["Immunities"] != null) {
                    i2 = new Set(i2[0]["Immunities"].split(','));
                }
                else {
                    i2 = new Set();
                }
            }
            else {
                w2 = new Set();
                r2 = new Set();
                i2 = new Set();
            }
            
            immunities = union(i1, i2);
            weaknesses = difference(union(difference(w1, r2), difference(w2, r1)), immunities);
            resistances = difference(union(difference(r1, w2), difference(r2, w1)), immunities);

            immunities = Array.from(immunities).join(', ');
            weaknesses = Array.from(weaknesses).join(', ');
            resistances = Array.from(resistances).join(', ');

            html += "<p>Weaknesses: " + weaknesses + "</p><p>Resistances: " + resistances;
            html += "</p><p>Immunities: " + immunities + "</p>";

            id = "#" + dexNum + "P"
            $(id).html(html);
            console.log(id);
        });

        
    });
    console.log(html);
}

// Computes union of two sets
function union(setA, setB) {
    const union = new Set(setA);

    for (const elem of setB) {
        union.add(elem);
    }

    return union;
}

// Computes the difference of two sets (for types)
function difference(setA, setB) {
    const diff = new Set(setA);

    for (const elem of setB) {
        diff.delete(elem);
    }

    return diff;
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

  function searchPokemon(n) {
      // Declare variables
  var input, filter, table, td, i, txtValue, inputName;
  //figure out which search bar to take input from
  switch(n) {
    case 0:
        inputName = "dex";
        break;
    case 1:
        inputName = "name";
        break;
    case 2:
        inputName = "cat";
        break;
    case 6:
        inputName = "ability";
        break;
    case 7:
        inputName = "type";
        break;
  }
  input = document.getElementById(inputName);
  filter = input.value.toUpperCase();
  table = document.getElementById("table_body");
  rows = table.rows;

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < rows.length; i+=2) {
    td = rows[i].getElementsByTagName("td")[n];
    txtValue = td.innerHTML
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
        rows[i].style.display = "";
        rows[i+1].style.display = "";
    } 
    else {
        rows[i].style.display = "none";
        rows[i+1].style.display = "none";
    }
  }
  }

