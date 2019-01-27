var database = require('../server/database');

var getUserById = function(id) {
  var connection = database.initDbConnection();
  var user;

  connection.query('SELECT * FROM users WHERE id=' + id, function (error, results, fields) {
    if (error) throw error;
    console.log('User: ', results);
    user = results;
  });
  
  connection.end();

  return user;
}

module.exports.getUserById = getUserById;