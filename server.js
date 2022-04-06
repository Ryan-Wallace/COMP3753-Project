// COMP 3753 Final Project server.js

// set up express app

const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');

const HOST_NAME = "bocxsfyiiez9fiwitohe-mysql.services.clever-cloud.com"
const MYSQL_USER = "unze0hqczieceyno"
const PASSWORD = "k6oE6Xb8gSRj3mS54dI1"
const POKEMON = "bocxsfyiiez9fiwitohe"

var mysql = require('mysql');
var connection = mysql.createConnection({
    host     : HOST_NAME,
    user     : MYSQL_USER,
    password : PASSWORD,
    database : POKEMON
});

app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(express.static(__dirname + '/'));

var database, all_customers, all_orders;

/*  format sql:
    var sql = "SELECT * FROM ?? WHERE ?? = ?";
    var inserts = ['users', 'id', userId];
    sql = mysql.format(sql, inserts);
*/

// get pokemon list
app.get('/api/pokemon', (req, res) => {

    connection.query('SELECT * FROM `pokemon` ORDER BY DexNum', function (error, results, fields) {
        if(error) {
            return res.status(500).send(error);
        }
        res.send(results);
    });
});

// get moves list
app.get('/api/moves', (req, res) => {

    connection.query('SELECT * FROM `moves`', function (error, results, fields) {
        if(error) {
            return res.status(500).send(error);
        }
        res.send(results);
    });
});

// get pokemon types
app.get('/api/types', (req, res) => {
    var typeInfo = "SELECT resists.Type, GROUP_CONCAT(DISTINCT resists.Resistance) as `Resistances`, GROUP_CONCAT(DISTINCT weakness.Weakness) as `Weaknesses`, GROUP_CONCAT(DISTINCT immunity.Immunity) as `Immunities` FROM resists LEFT JOIN weakness ON resists.Type = weakness.Type LEFT JOIN immunity ON resists.Type = immunity.Type GROUP BY resists.Type";

    connection.query(typeInfo, function (error, results, fields) {
        if(error) {
            return res.status(500).send(error);
        }
        res.send(results);
    });
});

// get learnable moves
app.get('/api/learns/:pokemon', (req, res) => {
    var poke_name = req.params.pokemon;
    var typeInfo = "SELECT Move, Lvl FROM learns WHERE Name = \"" + poke_name + "\"";

    connection.query(typeInfo, function (error, results, fields) {
        if(error) {
            return res.status(500).send(error);
        }
        res.send(results);
    });
});

// get pokemon locations
app.get('/api/found/:pokemon', (req, res) => {
    var poke_name = req.params.pokemon;
    var typeInfo = "SELECT Location, Terrain, Rate, Lvl FROM found WHERE Pokemon = \"" + poke_name + "\"";

    connection.query(typeInfo, function (error, results, fields) {
        if(error) {
            return res.status(500).send(error);
        }
        res.send(results);
    });
});

// deploy pokedex.html to localhost:8080
app.get("/", function(req, res){
    res.sendFile(__dirname + "/pokedex.html")
});

function reconnect() {

    connection = mysql.createConnection({
        host     : HOST_NAME,
        user     : MYSQL_USER,
        password : PASSWORD,
        database : POKEMON
    });

    connection.connect(function(err) {
        if (err) {
            console.error('error connecting: ' + err.stack);
            return;
        }
        connection.on('error', err => {
            if (err.code === 'PROTOCOL_CONNECTION_LOST') {
                console.log("reconnecting...");
                reconnect();
            } else {
                throw err;
            }
        });
    });
}

// listen on port 8080, connect to database
app.listen(8080, () => {
    connection.connect(function(err) {
        if (err) {
            console.error('error connecting: ' + err.stack);
            return;
        }
        connection.on('error', err => {
            if (err.code === 'PROTOCOL_CONNECTION_LOST') {
                console.log("reconnecting...");
                reconnect();
            } else {
                throw err;
            }
        });
        

        console.log("Database `" + POKEMON + "` connected as id " + connection.threadId);
        console.log("Listening on localhost:8080");
        console.log("Visit http://localhost:8080 to access the client.");
    });
});