var places = [];
var check_position_available = true;
var map;
var myPosition;
var current_item;

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

	if(myPosition){
		myPosition.setMap(null);
	}

	myPosition = new google.maps.Marker({
		map: map,
		position: pos,
		title: 'My Position'
	});
	myPosition.setMap(map);
	map.setCenter(pos);
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
		if(dist < places[i].accuracy/1000){
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
	place.type = "p";
	places.push(place);
	saveProgress();
}

function getPlace(id, callback){
	var req = new XMLHttpRequest();
	req.open('GET', '/getPlace/'+id, true);
	req.onreadystatechange = function (aEvt) {
		if (req.readyState == 4) {
			if(req.status == 200){
				callback(JSON.parse(req.responseText));
			}else{
				flashMessage("Erreur lors de ala récupération du lieu suivant.", "red");
			}
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

function checkIfPlaceExists(id){
	for(var i=0;i<places.length;i++){
		if(places[i].id == id){
			return true;
		}
	}
	return false;
}

function openPlace(id){
	if(!checkIfPlaceExists(id)){
		getPlace(id,addPlaceToList);
	}
}


function displayObject(client_id){
	displayItem(objects[client_id]);
}

function itemSuccess(item) {
	displayItemContent(item.name,item.success_content, item.success_content_type, "../"+item.success_media, null);
	itemUnlocks(item.objects_on_success, item.places_on_success, item.type +"-"+ item.id);
}

function displayItem(item){
	
	itemUnlocks(item.objects_on_open,item.places_on_open, item.type +"-"+ item.id);
	current_item = item;

	if(item.success_condition === "object" && checkIfObjectExists(item.success_key)){
		itemSuccess(item);
	}else if(item.success_condition === "occurence" && item.occurence == item.foundin.length){
		itemSuccess(item);		
	}else{
		if(item.success_condition === 'password'){
			displayItemContent(item.name,item.content, item.content_type, "../"+item.media,item.success_key);
		}else{
			displayItemContent(item.name,item.content, item.content_type, "../"+item.media);
		}
	}

}

function itemUnlocks(stringObj,stringPla,orig){
	if(stringObj){
		var objectsToGive = stringObj.split(",");
		for(var i=0;i<objectsToGive.length;i++){
			giveObjects(objectsToGive[i],orig);
		}
	}

	if(stringPla){
		var placeToOpen = stringPla.split(",");
		for(var i=0;i<placeToOpen.length;i++){
			openPlace(placeToOpen[i]);
		}
	}
}

function displayItemContent(name,caption,media_type,media_url, password){

	document.getElementById("content_title").innerHTML = name;
	document.getElementById("content_description").innerHTML = caption;

	var media_container = document.getElementById("content_media");
	media_container.innerHTML = "";

	switch (media_type){
		case "img": 
		case "audio":
		case "video":

			media = document.createElement(media_type);
			media.src = "../" + media_url;
			media_container.appendChild(media);

			a = document.createElement("a");
			a.href= "../" + media_url;
			a.innerHTML = "Voir le media dans un nouveau tab";
			a.target = "_new";
			media_container.appendChild(a);

			break;
			
		case "iframe":
			media = document.createElement(media_type);
			media.src = "../" + media_url;
			media_container.appendChild(media);
			break; 

	}

	var password_container = document.getElementById("content_password");
	if(password){
		document.getElementById("password_input").setAttribute("psw",password);
		password_container.style.display="block";
	}else{
		password_container.style.display="none";
	}
	document.getElementById("main_content").style.display = "block";
}

function showObject(id, client_id){
	document.querySelector(".object[object_id='"+ id +"']").style.display = "inherit";
	var occ_el= document.querySelector(".object[object_id='"+ id +"'] .occurence");
	if(occ_el){
		occ_el.innerHTML = objects[client_id].foundin.length;
	}
}

function giveObjects(id, orig){
	if(id<0){
		pathSucceeded();
		return;
	}
	var client_id = getObjectClientId(id);
	if(!objects[client_id].is_visible){
		objects[client_id].is_visible = true;
	}
	if(orig && objects[client_id].foundin.indexOf(orig)<0){
		objects[client_id].foundin.push(orig);
	}
	showObject(id, client_id);
	saveProgress();
}

function passwordSubmit(){
	var password_input = document.getElementById("password_input");
	if(password_input.getAttribute("psw") === password_input.value){
		flashMessage("Bien joué ! C'est la bonne réponse.", "green");
		itemSuccess(current_item);
	}else{
		flashMessage("Désolé... ce n'est pas la solution.","red");
	}
}

function pathSucceeded(){
	displayItemContent("Victoire",successContent);
}

function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

function saveProgress(){
	try{
		document.cookie = "places_"+path_id+"="+JSON.stringify(places);
		document.cookie = "objects_"+path_id+"="+JSON.stringify(objects);
	}catch(e){
		flashMessage(e,"red");
	}
}

function deleteProgress(){
	document.cookie = "places_"+path_id + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	document.cookie = "objects_"+path_id + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	document.location.reload(true);
}

function loadProgress(){
	try{
		var cookiePlaces = getCookie("places_"+path_id);
		var cookieObjects = getCookie("objects_"+path_id);

		if(cookiePlaces){
			places = JSON.parse(cookiePlaces);
		}
		if(cookieObjects){
			objects = JSON.parse(cookieObjects);
			for(var i=0;i<objects.length;i++){
				if(objects[i].is_visible>0){
					giveObjects(objects[i].id);
				}
			}
		}
	}catch(e){
		flashMessage(e,"red");
	}
}


function updateMenu() {
	var container = document.getElementById("menu_path");
	var p_el = document.createElement("p");
	p_el.innerHTML = "Effacer progression";
	p_el.setAttribute("onclick", "deleteProgress()");
	container.appendChild(p_el);
	container.style.display = "block";
	document.querySelector("#menu_path .menu_sub").innerHTML = path_name;
}


loadProgress();
updateMenu();