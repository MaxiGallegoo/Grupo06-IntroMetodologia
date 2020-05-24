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
	<script>
	function initMap() {
			var lista={$lista};
			var mapOptions = {
				zoom: 14,
				center: new google.maps.LatLng(lista[0][0],lista[0][1]),
				mapTypeId: 'roadmap'
			};
			
			var map = new google.maps.Map(document.getElementById('map'), mapOptions);
			for(i=0;i<lista.length;i++){
				var p1 = { lat:  lista[i][0], lng: lista[i][1]};
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
			}
	}
	</script>
</head>
<body>
	<div id="map"></div>
	<script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap">
	</script>
</body>
</html>
