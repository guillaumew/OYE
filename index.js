var mysql      = require('mysql');
var express = require('express');
var app = express();
var enforce = require('express-sslify');

app.set('port', (process.env.PORT || 5000));

app.use(express.static(__dirname + '/public'));

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

if( app.get('env') != "development"){
	app.use(enforce.HTTPS({ trustProtoHeader: true }));
}

var connection = mysql.createConnection({
  host     : process.env.DATABASE_HOST,
  user     : process.env.DATABASE_USER,
  password : process.env.DATABASE_PASSWORD,
  database : process.env.DATABASE_SCHEMA,
  port     : process.env.DATABASE_PORT
});


app.get('/', function(request, response) {
	connection.query('SELECT id, name, type, thumb from Paths', function(err, rows, fields) {
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
	connection.query('SELECT id, name, init_content, win_content, give_objects, open_places, latitude, longitude, total_steps from Paths where id='+request.params.pageid, function(err1, path, fields) {
		if (!err1) {
			if(path.length > 0){
				connection.query('SELECT * from Objects where path_id='+request.params.pageid, function(err2, objects, fields) {
					if (!err2) {
						response.render('pages/path',{"path":path[0], "objects":objects});
					}else{
						response.render('pages/error',{"content":err2});
						console.log('Error while performing Query.');
						console.log(err2);
					}
				});
			}else{
				response.render('pages/error',{"content":"The requested path does not exist in the database."});
			}
		}else{
			response.render('pages/error',{"content":err1});
			console.log('Error while performing Query.');
			console.log(err1);
		}
	});
});

app.get('/getObject/:objectid', function(request,response){
	connection.query('SELECT * from Objects where id='+request.params.objectid, function(err, raws, fields) {
		if (!err) {
			if(raws.length > 0){
				response.json(raws[0]);
			}else{
				response.json({"error" : "The requested object does not exist in the database."});
			}
		}else{
			response.json({"error" : err});
			console.log('Error while performing Query.');
			console.log(err);
		}
	});
});

app.get('/getPlace/:Placeid', function(request,response){
	connection.query('SELECT * from Places where id='+request.params.Placeid, function(err, raws, fields) {
		if (!err) {
			if(raws.length > 0){
				response.json(raws[0]);
			}else{
				response.json({"error" : "The requested place does not exist in the database."});
			}
		}else{
			response.json({"error" : err});
			console.log(err);
		}
	});
});


var server = app.listen(app.get('port'), function() {
	console.log('Node app is running on port', app.get('port'));
});

var io = require('socket.io')(server);
var player_number = 0 ;

io.on('connection', function (socket) {
  socket.emit('number', player_number );
  player_number++;
  socket.on('update_position', function (data) {
    socket.broadcast.emit('updateMap',data);
  });
});