const Pool = require("pg").Pool;

const pool = new Pool({
    user: "paulinalcoserchong",
    password: "Newelige.23",
    database: "splitwisedb",
    host: "localhost",
    port: 5432
});

module.exports = pool; 