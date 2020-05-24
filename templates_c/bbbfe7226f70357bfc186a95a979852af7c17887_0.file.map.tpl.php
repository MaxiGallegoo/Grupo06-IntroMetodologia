<?php
/* Smarty version 3.1.33, created on 2020-05-23 23:03:20
  from 'C:\xampp\htdocs\inmet master\templates\map.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5ec98f984cde03_27388450',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bbbfe7226f70357bfc186a95a979852af7c17887' => 
    array (
      0 => 'C:\\xampp\\htdocs\\inmet master\\templates\\map.tpl',
      1 => 1590267797,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5ec98f984cde03_27388450 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
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
	<?php echo '<script'; ?>
>
	function initMap() {
			var lista=<?php echo $_smarty_tpl->tpl_vars['lista']->value;?>
;
			console.log(lista);
			var mapOptions = {
				zoom: 14,
				center: new google.maps.LatLng(lista[0][0],lista[0][1]),
				mapTypeId: 'roadmap'
			};
			
			var map = new google.maps.Map(document.getElementById('map'), mapOptions);
			for(i=0;i<lista.length;i++){
				console.log(lista[i]);
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
	<?php echo '</script'; ?>
>
</head>
<body>
	<div id="map"></div>
	<?php echo '<script'; ?>
 async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap">
	<?php echo '</script'; ?>
>
</body>
</html>
<?php }
}
