<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Recorrido</title>
	<style>
		#map { 
			height: 100%;
		}
		/* Optional: Makes the sample page fill the window. */
		html, body { 
			height: 100%;
			margin: 0;
			padding: 0;
		}
	</style>
</head>
<body>
	<div id="map" ></div>
	<a href="{BASE_URL}">VOLVER</a>
	<a href="{BASE_URL}/estadisticaind">ESTADÍSTICAS</a>
	<div>
		<ul id="data">
		</ul>
	</div>
	<script>
	function initMap() {
			var lista={$lista};
			var divdata=document.getElementById('data');
			var mapOptions = {
				zoom: 14,
				center: new google.maps.LatLng(lista[0][0],lista[0][1]),
				mapTypeId: 'roadmap'
			};
			console.log(lista);
			var map = new google.maps.Map(document.getElementById('map'), mapOptions);
			for(i=0;i<lista.length;i++){
				var p1 = { lat:  lista[i][0]*1, lng: lista[i][1]*1};
				var marker = new google.maps.Marker({ 
					position: p1,
					map: map,
					title: lista[i][2],
					label: {
							color: 'white',
							fontWeight: 'bold',
							text: lista[i][2],
							},
					});
				divdata.innerHTML+="<li>"+lista[i][2]+" - "+lista[i][3]+"</li>";
			}
	}
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap">
	</script>
</body>
</html>
