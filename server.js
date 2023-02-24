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
  database: "bookmania",
});

con.connect(
  function(err) {
    if (err) throw err}
);

//API for all books
app.get("/get-all-books", (request,response) => {
    con.query(`select book.id, title, number_of_page, genre.genre, publisher.publisher_name , author.author_name, price, image, newness from book
    inner join author on author.id = book.author
    inner join genre on genre.id = book.genre
    inner join publisher on publisher.id = book.publisher`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
    });
})

//API for all newness books
app.get("/get-all-newness", (request,response) => {
    con.query(`
    SELECT book.id, title, number_of_page, genre.genre, publisher_name, author_name, price, image, newness FROM book
    INNER JOIN author on author.id = book.author
    INNER JOIN genre on genre.id = book.genre
    INNER JOIN publisher on publisher.id = book.publisher
    WHERE newness = 1
    `, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
    });
})

//API for books title names
app.get("/get-book-title/:titleName", (request, response) => {
  con.query(`
  SELECT book.id, title, number_of_page, genre.genre, publisher_name, author_name, price, image, newness FROM book
  INNER JOIN author on author.id = book.author
  INNER JOIN genre on genre.id = book.genre
  INNER JOIN publisher on publisher.id = book.publisher
  WHERE title LIKE "%${request.params.titleName}%" OR author_name LIKE "%${request.params.titleName}%"`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
})

//API for coupon code image
app.get("/img/:filename", function (req, res) {
    res.sendFile(path.join(__dirname, "img/" + req.params.filename));
})

//API for books image
app.get("/books_img/:filename", function (req, res) {
  res.sendFile(path.join(__dirname, "books_img/" + req.params.filename));
})


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

//APIs which are not necessary
/*
//API for all publisher
app.get("/get-all-publisher", (request,response) => {
  con.query(`SELECT * FROM publisher`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
});

//API for publisher id
app.get("/get-publisher-id/:id", (request, response) => {
  con.query(`SELECT * FROM publisher WHERE id = ${request.params.id}`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
})

//API for books id
app.get("/get-book-id/:id", (request, response) => {
  con.query(`
  SELECT book.id, title, number_of_page, genre.genre, publisher_name, author_name, price, image, newness FROM book
  INNER JOIN author on author.id = book.author
  INNER JOIN genre on genre.id = book.genre
  INNER JOIN publisher on publisher.id = book.publisher
  WHERE book.id = ${request.params.id}`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
})

//API for all genre
app.get("/get-all-genre", (request,response) => {
  con.query(`SELECT * FROM genre`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
});
*/
