var mysql = require('mysql');

var initDbConnection = function() {
  var connection = mysql.createConnection({
    host     : process.env.DB_HOST,
    user     : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_NAME
  });
  connection.connect();
  console.log('Database connection initialized');
  return connection;
}

module.exports.initDbConnection = initDbConnection;