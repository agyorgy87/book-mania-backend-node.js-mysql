const express = require("express");
let cors = require("cors");
let fileSystem = require("fs");

const app = express();
const path = require("path");

app.use(express.static("assets"));
app.use(cors());
app.use(express.json());
app.set("port", 4000);

const mysql = require('mysql');

const con = mysql.createConnection({
  host: "localhost",
  user: "bookmania",
  password: "1234",
  database: "bookmania"
});

con.connect(function(err) {
  if (err) throw err;
  con.query(`select book.id, title, number_of_page, genre.genre, publisher.publisher_name , author.author_name, price, image, newness from book
  inner join author on author.id = book.author
  inner join genre on genre.id = book.genre
  inner join publisher on publisher.id = book.publisher`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});

app.get("/", (request,response) => {
    const responseObject = {
        text: "server is working on port!"
    }
    response.end(JSON.stringify(responseObject));
});

const server = app.listen(app.get("port"), function() {

    let host = server.address().address
    let port = server.address().port

    console.log("app listening:", port)
})

app.get("/img/:filename", function (req, res) {
    res.sendFile(path.join(__dirname, "img/" + req.params.filename));
})