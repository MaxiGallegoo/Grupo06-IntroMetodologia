<?php
/* Smarty version 3.1.33, created on 2020-05-24 03:51:43
  from 'C:\xampp\htdocs\test\templates\map.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5ec9d32fde8394_10464862',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9a47bc2a448fe9c144d5e605c8ddd7c0c9398e2f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\test\\templates\\map.tpl',
      1 => 1590279324,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5ec9d32fde8394_10464862 (Smarty_Internal_Template $_smarty_tpl) {
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
