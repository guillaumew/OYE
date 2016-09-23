var places = [];
var check_position_available = true;
var map;
var myPosition;

function mapReady(){
	if(path_lat && path_long)
	map = new google.maps.Map(document.getElementById('map'), {
		center: {lat:path_lat,lng:path_long},
		scrollwheel: false,
		zoom: 15
	});
}

function updateMap(pos){

	if(!map){
		map = new google.maps.Map(document.getElementById('map'), {
			center: pos,
			scrollwheel: false,
			zoom: 16
		});		
	}

	myPosition = new google.maps.Marker({
		map: map,
		position: pos,
		title: 'My Position'
	});
	myPosition.setMap(map);
	map.setCenter(pos);
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

function addMarkerToMap(lat,long){
	var position = new google.maps.LatLng(lat,long);
	var iPlace = new google.maps.Marker({
		map: map,
		position: position,
		title: "Lieu d'intérêt",
		icon: "../img/grey_pin.png"
	});
	iPlace.setMap(map);
}

function displayPlace(client_id){
	displayItem(places[client_id]);
	addMarkerToMap(places[client_id].latitude,places[client_id].longitude)
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

function getObjectClientId(id){
	for(var i=0;i<objects.length;i++){
		if(objects[i].id == id){
			return i;
		}
	}
	console.log("Not found");
	return -1;
}

function checkIfObjectExists(id){
	for(var i=0;i<objects.length;i++){
		if(objects[i].id == id && objects[i].is_visible){
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
	
	itemUnlocks(item.objects_on_open,item.places_on_open);

	if(item.success_condition === "object" && checkIfObjectExists(item.success_key)){
		displayItemContent(item.name,item.success_content, item.success_content_type, "../"+item.success_media);
		itemUnlocks(item.objects_on_success, item.places_on_success);
	}else{
		displayItemContent(item.name,item.content, item.content_type, "../"+item.media);
	}

}

function itemUnlocks(stringObj,stringPla){
	if(stringObj){
		var objectsToGive = stringObj.split(",");
		for(var i=0;i<objectsToGive.length;i++){
			giveObjects(objectsToGive[i]);
		}
	}

	if(stringPla){
		var placeToOpen = stringPla.split(",");
		for(var i=0;i<placeToOpen.length;i++){
			openPlace(placeToOpen[i]);
		}
	}
}

function displayItemContent(name,caption,media_type,media_url){

	var container = document.getElementById("current_content");
	container.innerHTML = "";
	document.getElementById("main_content").style.display ="block";
	var title = document.createElement("h4");
	title.innerHTML = name;
	container.appendChild(title);

	switch (media_type){
		case "img":
			caption_el = document.createElement("p");
			caption_el.innerHTML = caption;
			container.appendChild(caption_el);

			media = document.createElement(media_type);
			media.src = "../" + media_url;
			container.appendChild(media);

			a = document.createElement("a");
			a.href= "../" + media_url;
			a.innerHTML = "Voir le media dans un nouveau tab";
			a.target = "_new";
			container.appendChild(a);

			break;
		default:
			var description = document.createElement("div");
			description.innerHTML = caption;
			container.appendChild(description);

	}
}

function showObject(id){
	document.querySelector(".object[object_id='"+ id +"']").style.display = "inherit";
}

function giveObjects(id){
	var client_id = getObjectClientId(id);
	if(!objects[client_id].is_visible){
		showObject(id);
		objects[client_id].is_visible = true;
	}
}
