var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  // res.send('respond with a resource');
  var usersCtrl = require('../controllers/usersController');
  var result = usersCtrl.getUserById(1);
  console.log(result);
});

module.exports = router;
