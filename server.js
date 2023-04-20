const express = require("express");
let cors = require("cors");
let fileSystem = require("fs");
let jwt = require('jsonwebtoken');
const secretKey = "Asdfjkle987123!?";

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
    con.query(`
    SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name , author.author_name, price, image, newness, release_date, img_directory, image_big, book_description FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
})

//API for all newness books
app.get("/get-all-by-newness/:newness", (request,response) => {
    con.query(`
    SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name, author.author_name, price, image, newness, img_directory, release_date, image_big, book_description FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE newness = ${request.params.newness}`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
})

//API for all authors
app.get("/get-all-by-author/:author_name", (request,response) => {
  con.query(`
  SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name, author.author_name, price, image, newness, img_directory, release_date, image_big, book_description FROM book
  INNER JOIN author ON author.id = book.author
  INNER JOIN genre ON genre.id = book.genre
  INNER JOIN publisher ON publisher.id = book.publisher
  WHERE author_name LIKE "${request.params.author_name}"`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
})

//API for all genre
app.get("/get-all-genre", (request,response) => {
  con.query(`
  SELECT * FROM genre
  `, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
});

//API for all publisher
app.get("/get-all-publisher", (request,response) => {
  con.query(`SELECT * FROM publisher`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
});

/*
//API for a publisher, display all types except one
app.get("/get-all-by-publisher-and-not-genre-type/:publisher/:genreType", (request,response) => {
  con.query(`
  SELECT book.id, title, number_of_page, genre.genre_type, publisher_name, author_name, price, image, newness, img_directory FROM book
  INNER JOIN author on author.id = book.author
  INNER JOIN genre on genre.id = book.genre
  INNER JOIN publisher on publisher.id = book.publisher
  WHERE publisher_name LIKE "${request.params.publisher}" AND genre_type <> "${request.params.genreType}"
  `, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
})
*/

//API for all genre books
app.get("/get-all-by-genre/:genreType", (request,response) => {
  con.query(`
  SELECT title, genre.genre_type, author_name, price, image,  img_directory FROM book
  INNER JOIN author ON author.id = book.author
  INNER JOIN genre ON genre.id = book.genre
  INNER JOIN publisher ON publisher.id = book.publisher
  WHERE genre_type LIKE ${request.params.genreType}`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
})

//API for all price
app.get("/get-all-by-price/:fromPrice/:toPrice", (request,response) => {
  con.query(`
  SELECT title, author_name, price, image, img_directory FROM book
  INNER JOIN author on author.id = book.author
  INNER JOIN genre on genre.id = book.genre
  INNER JOIN publisher on publisher.id = book.publisher
  WHERE price > ${request.params.fromPrice} AND price < ${request.params.toPrice}`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
})

//API for all release date
app.get("/get-all-by-release-date/:fromDate/:toDate", (request,response) => {
  con.query(`
  SELECT title, publisher_name, author_name, price, image, release_date, img_directory FROM book
  INNER JOIN author ON author.id = book.author
  INNER JOIN genre ON genre.id = book.genre
  INNER JOIN publisher ON publisher.id = book.publisher
  WHERE release_date > ${request.params.fromDate} AND release_date < ${request.params.toDate}`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
})

//API for all special
app.get("/get-all-by-special/:specialSearch/:specialOrder", (request,response) => {
  let specialSearch = "";
  if(request.params.specialSearch === "title_name"){
     specialSearch = "title"
  }
  else if(request.params.specialSearch === "number_of_page_name"){
    specialSearch = "number_of_page"
  }
  else if(request.params.specialSearch === "price_name"){
    specialSearch = "price"
  }
  con.query(`
  SELECT title, number_of_page, author_name, price, image, img_directory FROM book
  INNER JOIN author ON author.id = book.author
  INNER JOIN genre ON genre.id = book.genre
  INNER JOIN publisher ON publisher.id = book.publisher
  ORDER BY ${specialSearch} ${request.params.specialOrder}`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
}) 

//API for all Publishers
app.get("/get-all-by-publishers/:publisherSearch", (request,response) => {
  con.query(`SELECT book.id, title, number_of_page, genre.genre_type, publisher_name, author_name, price, image, newness, release_date, img_directory FROM book
  INNER JOIN author ON author.id = book.author
  INNER JOIN genre ON genre.id = book.genre
  INNER JOIN publisher ON publisher.id = book.publisher
  WHERE publisher_name = "${request.params.publisherSearch}"`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
  });
}) 

//API for books title names
app.get("/get-book-title/:titleName", (request, response) => {
    con.query(`
    SELECT title, author_name, price, image, img_directory FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE title LIKE "%${request.params.titleName}%" OR author_name LIKE "%${request.params.titleName}%"`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
  })
})

//API for registration
app.post("/register",(request, response) => {
  console.log(request.body);
  console.log(request.body.name);
  con.query(`
  INSERT INTO users VALUES (null, "${request.body.firstName}", "${request.body.lastName}", ${request.body.gender}, "${request.body.address}", "${request.body.city}", ${request.body.zipCode}, "${request.body.email}", sha1("salt${request.body.pass}"))`,
  function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify({succes:true}));
  }) 
})

//API for coupon code image
app.get("/img/:filename", function (req, res) {
    res.sendFile(path.join(__dirname, "img/" + req.params.filename));
})

//API for books image
app.get("/books_img/:directory/:filename", function (req, res) {
  res.sendFile(path.join(__dirname, "books_img/" + req.params.directory + "/" + req.params.filename));
})

app.post("/auth",function (request, response) {
  con.query(`
  SELECT * FROM users
  WHERE email = "${request.body.email}" AND pass = sha1("${request.body.pass}");`,
  function (err, result, fields) {
    if (err) throw err;
    if(result.length === 0) {
      throw "hibás felhasználónév és jelszó"
    }else{
      let token = jwt.sign(result[0], secretKey);
      let obj = { jwt: token }
      response.end(JSON.stringify(obj));
    }
    console.log(result);
  }) 

  
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
  SELECT book.id, title, number_of_page, genre.genre_type, publisher_name, author_name, price, image, newness FROM book
  INNER JOIN author on author.id = book.author
  INNER JOIN genre on genre.id = book.genre
  INNER JOIN publisher on publisher.id = book.publisher
  WHERE book.id = ${request.params.id}`, function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    response.end(JSON.stringify(result));
  })
})


*/
