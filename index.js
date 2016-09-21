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
	connection.query('SELECT id, name from Paths', function(err, rows, fields) {
		if (!err) {
			response.render('pages/index',{"paths":rows});
		}else{
			response.render('pages/error',{"content":err});
			console.log('Error while performing Query.');
			console.log(err);
		}
	});
});

app.get('/path/:pageid', function(request,response){
	connection.query('SELECT name, init_content from Paths where id='+request.params.pageid, function(err, path, fields) {
		if (!err) {
			if(path.length > 0){
				response.render('pages/path',{"path":path[0]});
			}else{
				response.render('pages/error',{"content":"The requested path does not exist in the database."});
			}
		}else{
			response.render('pages/error',{"content":err});
			console.log('Error while performing Query.');
			console.log(err);
		}
	});
});

app.listen(app.get('port'), function() {
	console.log('Node app is running on port', app.get('port'));
});

