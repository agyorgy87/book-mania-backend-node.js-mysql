require("dotenv").config();
//console.log(process.env);

const express = require("express");
const cors = require("cors");
let fileSystem = require("fs");
let jwt = require('jsonwebtoken');
const secretKey = "Asdfjkle987123!?";

const app = express();
const path = require("path");

app.use(express.static("assets"));
app.use(cors());
app.use(express.json());
app.set("port", process.env.PORT || 3001);

const mysql = require('mysql2');
const { error } = require("console");

const getMysqlConnection = () => {
    const con = mysql.createConnection({
        host: process.env.MYSQL_HOST,
        port: process.env.MYSQL_PORT,
        user: process.env.MYSQL_USERNAME,
        password: process.env.MYSQL_PASSWORD,
        database: process.env.MYSQL_DATABASE,
    }); 
    con.connect(
        function(err) {
          if (err) throw err}
    );
    return con;
}

//API for all books
app.get("/get-all-books", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name , author.author_name, price, image, newness, release_date, img_directory, image_big, book_description FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
    con.end();
})

//API for all newness books
app.get("/get-all-by-newness/:newness", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name, author.author_name, price, image, newness, img_directory, release_date, image_big, book_description FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE newness = ${request.params.newness}`, function (err, result, fields) {
      /*
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
        */
        if (err) {
            console.log(err);
            response.status(500).send("server error");
        } else {
            console.log(result);
            response.status(200).json(result);
        }
    });
    con.end();
})

//API for all authors
app.get("/get-all-by-author/:author_name", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name, author.author_name, price, image, newness, img_directory, release_date, image_big, book_description FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE author_name LIKE "${request.params.author_name}"`, function (err, result, fields) {
    /*
      if (err) throw err;
      console.log(result);
      response.end(JSON.stringify(result));
      */
        if (err) {
            console.log(err);
            response.status(500).send("server error");
        } else {
            console.log(result);
            response.status(200).json(result);
        }
  });
    con.end();
})

//API for all genre
app.get("/get-all-genre", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT * FROM genre
    `, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    })
    con.end();
});

//API for all publisher
app.get("/get-all-publisher", (request,response) => {
    const con = getMysqlConnection();
    con.query(`SELECT * FROM publisher`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    })
    con.end();
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
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, genre.genre_type, author_name, price, image,  img_directory FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE genre_type LIKE ${request.params.genreType}`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
    con.end();
})

//API for all price
app.get("/get-all-by-price/:fromPrice/:toPrice", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, author_name, price, image, img_directory FROM book
    INNER JOIN author on author.id = book.author
    INNER JOIN genre on genre.id = book.genre
    INNER JOIN publisher on publisher.id = book.publisher
    WHERE price > ${request.params.fromPrice} AND price < ${request.params.toPrice}`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
    con.end();
})

//API for all release date
app.get("/get-all-by-release-date/:fromDate/:toDate", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, publisher_name, author_name, price, image, release_date, img_directory FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE release_date > ${request.params.fromDate} AND release_date < ${request.params.toDate}`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
    con.end();
})

//API for all special
app.get("/get-all-by-special/:specialSearch/:specialOrder", (request,response) => {

    const con = getMysqlConnection();

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
    SELECT book.id, title, number_of_page, author_name, price, image, img_directory FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    ORDER BY ${specialSearch} ${request.params.specialOrder}`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    });
    con.end();
}) 

//API for all Publishers
app.get("/get-all-by-publishers/:publisherSearch", (request,response) => {
    const con = getMysqlConnection();
    con.query(`SELECT book.id, title, number_of_page, genre.genre_type, publisher_name, author_name, price, image, newness, release_date, img_directory FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE publisher_name = "${request.params.publisherSearch}"`, function (err, result, fields) {
        /*
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
        */
        if (err) {
            console.log(err);
            response.status(500).send("server error");
        } else {
            console.log(result);
            response.status(200).json(result);
        }
    });
    con.end();
}) 

//API for books title names
app.get("/get-book-title/:titleName", (request, response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT book.id, title, author_name, price, image, img_directory FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE title LIKE "%${request.params.titleName}%" OR author_name LIKE "%${request.params.titleName}%"`, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
  })
    con.end();
})

//API for add wishlist
app.post("/add-wishlist",(request, response) => {
    const con = getMysqlConnection();
    con.query(`
    INSERT INTO wishlist VALUES (NULL, ${request.body.userId}, ${request.body.bookId})
    `,
    function (err, result, fields) {
        if (err) throw err;
        console.log(result.insertId);
        response.end(JSON.stringify({success:true}));
    });
    con.end();
})

//API for delete wishlist
app.post("/delete-wishlist", (request, response) => {
    const con = getMysqlConnection();
    con.query(`
    DELETE FROM wishlist WHERE user_id = ${request.body.userId} AND book_id = ${request.body.bookId}
    `,
    function (err, result, fields) {
        if (err) throw err;
        response.end(JSON.stringify({success:true}));
    })
    con.end();
})

//API for display wishlist
app.get("/display-wishlist/:userId/:bookId", (request, response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT user_id, book_id FROM wishlist
    WHERE user_id = ${request.params.userId} AND book_id = ${request.params.bookId}
    `,
    function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        //response.end(JSON.stringify({success:true}));
        response.end(JSON.stringify(result));
    })
    con.end();
})

//API for login user - wishlist
app.get("/user-wishlist/:userId", (request, response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT * FROM bookmania.wishlist
    INNER JOIN book ON book.id = wishlist.book_id
    INNER JOIN author ON author.id = book.author
    WHERE user_id = ${request.params.userId}
    `,
    function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    })
    con.end();
})

//API for ID of user's favorite books
app.get("/get-user-all-favorit-book/:userId", (request, response) => {
    const con = getMysqlConnection();
    con.query(`
    SELECT * FROM bookmania.wishlist
    WHERE user_id = ${request.params.userId};
    `,
    function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result));
    })
    con.end();
})


//API for user registration
app.post("/register",(request, response) => {
    const con = getMysqlConnection();
    con.query(`
    INSERT INTO users VALUES (null, "${request.body.firstName}", "${request.body.lastName}", ${request.body.gender}, "${request.body.address}", "${request.body.city}", ${request.body.zipCode}, "${request.body.email}", sha1("salt${request.body.pass}"))`,
    function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify({succes:true}));
    }) 
    con.end();
})

//API for registered email address
//if the user has already registered with the same email address, he will receive an alert message.
app.get("/get-user-email/:userEmail", function (request, response) {
    const con = getMysqlConnection();
    con.query(`
    SELECT * FROM users
    WHERE email = "${request.params.userEmail}";`,
    function (err, result, fields) {
        if(result.length === 0) {
            response.end(JSON.stringify({success: false}))
        }else{
            response.end(JSON.stringify({success: true}))
        }
    });
    con.end();
})

//API for coupon code image
app.get("/img/:filename", function (request, response) {
    const con = getMysqlConnection();
    response.sendFile(path.join(__dirname, "img/" + request.params.filename));
    con.end();
})

//API for books image
app.get("/books_img/:directory/:filename", function (request, response) {
    const con = getMysqlConnection();
    response.sendFile(path.join(__dirname, "books_img/" + request.params.directory + "/" + request.params.filename));
    con.end();
})

//API for authentication
app.post("/auth",function (request, response) {
    const con = getMysqlConnection();
    con.query(`
    SELECT * FROM users
    WHERE email = "${request.body.email}" AND pass = sha1("salt${request.body.pass}");`,
    function (err, result, fields) {
        if (err) throw err;
        if(result.length === 0) {
        console.log(err);
        console.log(result);
        console.log("ez a request.body.email: " + request.body.email);
        console.log("ez a request.body.pass: " + request.body.pass);
        let userObj = {error: "incorrect email or password"};
        response.end(JSON.stringify(userObj));
        }else{
        console.log("ez a request.body.email: " + request.body.email);
        console.log("ez a request.body.pass: " + request.body.pass);
        let expire = Math.floor(Date.now() / 1000) + (60 * 60)
        let user = {id: result[0].id, email: result[0].email, exp: expire}
        let token = jwt.sign(user, secretKey);
        let obj = {id: result[0].id, jwt: token, firstName: result[0].first_name, expireDate: expire};
        response.end(JSON.stringify(obj));
        }
        console.log(result);
    }); 
    con.end();
})

function verifyToken (token) {
    try{
      jwt.verify(token, secretKey)
      return true;
    }catch(errorMessage){
      return false;
    } 
}

app.post("/place-order", function (request, response) {
    let verify = verifyToken(request.body.token);
    if(verify === true) {
        let obj = {success: true, message: "successful order"}
        response.end(JSON.stringify(obj));
    }else{
        let obj = {error: "invalid token"}
        response.end(JSON.stringify(obj));
    }
})

//API for forgot password
app.get("/get-forgot-password/:userEmail", function (request, response) {
    const con = getMysqlConnection();
    con.query(`
    SELECT * FROM users
    WHERE email = "${request.params.userEmail}";`,
    function (err, result, fields) {
        if(result.length === 0) {
            response.end(JSON.stringify({success: false}))
        }else{
            response.end(JSON.stringify({success: true}))
        }
    });
    con.end();
})

app.get("/get-book-by-id/:id", function (request, response) {
    const con = getMysqlConnection();
  con.query(`
    SELECT book.id, title, number_of_page, genre.genre_type, publisher.publisher_name , author.author_name, price, image, newness, release_date, img_directory, image_big, book_description FROM book
    INNER JOIN author ON author.id = book.author
    INNER JOIN genre ON genre.id = book.genre
    INNER JOIN publisher ON publisher.id = book.publisher
    WHERE book.id = ${request.params.id}
    `, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify(result[0]));
    });
    con.end();
})

//API's for coupon codes
app.get("/get-coupon-code/:couponCode", function (request, response) {
    const con = getMysqlConnection();
    con.query(`
        SELECT * FROM bookmania.coupons
        WHERE coupon = "${request.params.couponCode}" AND usedornot = 0;
        `, function (err, result, fields) { 
        if(result.length !== 0 && result[0].usedornot === 0){
            response.end(JSON.stringify({success: true, bookMultiple: result[0].multiple}))
        }else{
            response.end(JSON.stringify({success: false}))
        }
        });
    con.end();
})

app.get("/set-coupon-used/:couponCode", function (request, response) {
    const con = getMysqlConnection();
    con.query(`
        UPDATE bookmania.coupons SET usedornot = '1' WHERE (coupon = "${request.params.couponCode}");
        `, function (err, result, fields) { 
        response.end(JSON.stringify({success:true}));
        });
    con.end();
})

//API's for shipping
app.get("/get-registered-user/:userId", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
        SELECT * FROM users WHERE id = ${request.params.userId};
        `, function (err, result, fields) {
            if (err) throw err;
            console.log(result);
            response.end(JSON.stringify(result));
        });
        con.end();
})

//API's send order
app.post("/send-order", (request,response) => {
    const con = getMysqlConnection();
    con.query(`
        INSERT INTO bookmania.orders (user_id, total_price, discount, zip_code, city, address) 
        VALUES (${request.body.userId}, ${request.body.totalPrice}, ${request.body.discount}, "${request.body.address.zipCode}", 
        "${request.body.address.city}", "${request.body.address.address}");
        `, function (err, result, fields) {
            if (err) throw err;
            console.log(result.insertId);
            for(let i = 0; i < request.body.books.length; i++){
                con.query(`
                INSERT INTO bookmania.order_books (book_id, book_price, order_id, quantity) 
                VALUES (${request.body.books[i].id}, ${request.body.books[i].price}, ${result.insertId}, ${request.body.books[i].quantity});
                `, () => {})
            }
            response.end(JSON.stringify(result));
        });
    con.end();
})

//API for contacts
app.post("/message-sender", (request, response) => {
    const con = getMysqlConnection();
    con.query(`
        INSERT INTO contacts VALUES (null, "${request.body.name}", "${request.body.email}", "${request.body.text}")`,
        function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        response.end(JSON.stringify({succes:true}));
    }) 
    con.end();
})

app.get("/", (request,response) => {
    const con = getMysqlConnection();
    const responseObject = {
        text: "server is working on port!"
    }
    response.end(JSON.stringify(responseObject));
    con.end();
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
