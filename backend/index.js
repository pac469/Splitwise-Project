const express = require("express");
const app = express();
const pool = require("./database")
// const cors = require("cors")

const port = process.env.PORT || 9000

//Middlewares
app.use(express.json());
// app.use(cors);

//-------------------------------------------------users

app.get("/users/:userid", async (req, res) => {
    try {
        const { userid } = req.params;
        const user = await pool.query(
            "SELECT * FROM usertable WHERE usertable.userId = $1",
            [userid]
        );
        if(user.rows.length)
            res.json(user.rows[0]);
        else 
            res.json(user.rows)//return empty array
    } catch (err) {
        console.error('CaughtError: ', err.message);
    }

});

app.get("/matches", async (req, res) => {
    try {
        const { email_str } = req.body;
        const users = await pool.query(
            "SELECT * from usertable where usertable.email LIKE $1",
            [`${email_str}%`]
        )
        res.json(users.rows)
    } catch (err) {
        console.error('CaughtError: ', err.message);
    }
});

app.post("/users", async (req, res) => {
    try {
        const { username, password, name } = req.body;
        const newUser = await pool.query(
            "INSERT INTO usertable VALUES (DEFAULT, $1 , $2 , $3) RETURNING *",
            [username, password, name]
        )
        res.json(newUser.rows[0]);

    } catch (err) {
        console.error('CaughtError: ', err.message);
    }
});

app.listen(port, () => {
    console.log(`Server is listening port ${9000}`);
}) 