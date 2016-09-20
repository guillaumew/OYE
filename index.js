var mysql      = require('mysql');
var express = require('express');
var app = express();

app.set('port', (process.env.PORT || 5000));

app.use(express.static(__dirname + '/public'));

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

console.log(process.env.DATABASE_HOST);

var connection = mysql.createConnection({
  host     : process.env.DATABASE_HOST,
  user     : process.env.DATABASE_USER,
  password : process.env.DATABASE_PASSWORD,
  database : process.env.DATABASE_SCHEMA,
  port     : process.env.DATABASE_PORT
});


app.get('/', function(request, response) {
	connection.query('SELECT * from Tags', function(err, rows, fields) {
		if (!err) {
			response.render('pages/index',{"tags":rows});
		}else{
			response.render('pages/index',{"tags":[]});
			console.log('Error while performing Query.');
			console.log(err);
		}
	});
});

app.listen(app.get('port'), function() {
	console.log('Node app is running on port', app.get('port'));
});

