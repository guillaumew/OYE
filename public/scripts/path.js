var objects = [];
var places = [];
var check_position_available = true;


function mapReady(){
	var map = new google.maps.Map(document.getElementById('map'), {
		center: {lat:47.216671,lng:-1.55},
		scrollwheel: false,
		zoom: 14
	});
}

function updateMap(pos){

	var myLatLng = pos;

	var map = new google.maps.Map(document.getElementById('map'), {
		center: myLatLng,
		scrollwheel: false,
		zoom: 16
	});

	var marker = new google.maps.Marker({
		map: map,
		position: myLatLng,
		title: 'My Position'
	});
}


function flashMessage(message,color){
	console.log(message);
}

function computeDistance(coords1,coords2){
	var lat_place1 = coords1.latitude;
	var lat_place2 = coords2.latitude;
	var long_place1 = coords1.longitude;
	var long_place2 =  coords2.longitude;
	return Math.acos(Math.sin(lat_place1 * Math.PI / 180)*Math.sin((Math.PI / 180 * lat_place2))+Math.cos((Math.PI / 180 * lat_place1))*Math.cos((Math.PI / 180 * lat_place2))*Math.cos(Math.PI / 180 * (long_place1-long_place2)))*6371 ;

}

function displayPlace(client_id){
	displayItem(places[client_id]);
}

function checkPlaceReached(position){
	for(var i=0;i<places.length;i++){
		var dist = computeDistance (position,places[i]);
		if(dist < 0.02){
			displayPlace(i);
		}
	}
}

function checkPosition(){
	if(check_position_available){
		check_position_available = false;
		position_content = document.getElementById("position_content");
		position_content.innerHTML = "Verification en cours";
		function errorPostion(err){
			console.log(err);
			flashMessage("Une erreur est survenue","red");
			check_position_available = true;
			position_content.innerHTML = "Vérifier ma position";
		}

		function displayPosition(position){
			updateMap({lat: position.coords.latitude, lng: position.coords.longitude});
			checkPlaceReached(position.coords);
			flashMessage("Votre position a été mise à jour","green");
			check_position_available = true;
			position_content.innerHTML = "Vérifier ma position";
		}
		navigator.geolocation.getCurrentPosition(displayPosition,errorPostion);
	}

}

function addPlaceToList(place){
	if(true){
		places.push(place);
	}
}

function getPlace(id, callback){
	var req = new XMLHttpRequest();
	req.open('GET', '/getPlace/'+id, true);
	req.onreadystatechange = function (aEvt) {
		if (req.readyState == 4) {
			if(req.status == 200)
				callback(JSON.parse(req.responseText));
		}
	};
	req.send(null);
}

function getObject(id, callback){
	var req = new XMLHttpRequest();
	req.open('GET', '/getObject/'+id, true);
	req.onreadystatechange = function (aEvt) {
		if (req.readyState == 4) {
			if(req.status == 200)
				callback(JSON.parse(req.responseText));
		}
	};
	req.send(null);
}

function checkIfObjectExists(id){
	for(var i=0;i<objects.length;i++){
		if(objects[i].id == id){
			return true;
		}
	}
	return false;
}

function openPlace(id){
	getPlace(id,addPlaceToList);
}



function displayObject(client_id){
	displayItem(objects[client_id]);
}

function displayItem(item){
	
	if(item.objects_on_open){
		var objectsToGive = item.objects_on_open.split(",");
		for(var i=0;i<objectsToGive.length;i++){
			giveObjects(objectsToGive[i]);
		}
	}

	if(item.places_on_open){
		var placeToOpen = item.places_on_open.split(",");
		for(var i=0;i<placeToOpen.length;i++){
			openPlace(placeToOpen[i]);
		}
	}

	var container = document.getElementById("current_content");
	container.innerHTML = "";
	document.getElementById("main_content").style.display ="block";
	var title = document.createElement("h4");
	title.innerHTML = item.name;
	container.appendChild(title);

	switch (item.content_type){
		case "img":
			caption = document.createElement("p");
			caption.innerHTML = item.content;
			container.appendChild(caption);

			media = document.createElement(item.content_type);
			media.src = "../" + item.media;
			container.appendChild(media);

			a = document.createElement("a");
			a.href= "../" + item.media;
			a.innerHTML = "Voir le media dans un nouveau tab";
			a.target = "_new";
			container.appendChild(a);

			break;
		default:
			var description = document.createElement("div");
			description.innerHTML = item.content;
			container.appendChild(description);

	}
}

function showObject(object){
	var container = document.getElementById("objects_list");
	
	var object_container = document.createElement("div");
	object_container.classList.add("object");
	object_container.setAttribute("object_id",object.id);
	object_container.setAttribute("onclick","displayObject("+object.client_id+");");
	
	var object_img = document.createElement("img");
	object_img.src = "../" + object.thumb;

	var object_title = document.createElement("span");
	object_title.innerHTML = object.name;

	object_container.appendChild(object_img);
	object_container.appendChild(object_title);
	container.appendChild(object_container);
}

function writeObject(object){
	if(!checkIfObjectExists(object.id)){
		objects.push(object);
		object.client_id = objects.length - 1 ;
		showObject(object);
	}
}

function giveObjects(id){
	getObject(id, writeObject);
}
