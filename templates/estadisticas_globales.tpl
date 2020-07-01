{* <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Principal</title>
</head>
    <body>
    <h3>Estadistica</h3>
        <div class="medio">
        <div class="container">
            <h4>Estadisticas Globales</h4>
            <ul class="list-group">
            {foreach from=$Estadisticas item=$estadistica}
            <li class="list-group-item"> Km Recorridos: {$estadistica->km_recorrido} - Cantidad Paises Visitados: $ {$estadistica['cant_paises_visitados']} - huella carbono: {$estadistica['huella_carbono']} - Horas Viajadas: {$estadistica['horas_viajadas']}</li>
            {/foreach}
            </ul>
        </div>
    </body>
</html> *}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estad&iacutesticas</title>

    <link rel="stylesheet" href="./styles/master.css">
</head>
<body>
    <div class="content">
        <h2 class="viajes_title">Estad&iacutesticas de mis viajes</h2>
            <div>
                <h4 style="margin:0; font-weight:600"; >Pa&iacuteses visitados: 4</h4>
                <img src="./images/france.png" style="width: 20px; heigth: 20px;"> 
                <img src="./images/eeuu.png" style="width: 20px; heigth: 20px;">
                <img src="./images/uk.png" style="width: 20px; heigth: 20px;">
                <img src="./images/brazil.png" style="margin-bottom:4; margin-top:4%; width: 20px; heigth: 20px;">
            </div>
            <div>
                <h4 style="margin:0; margin-top:6%; font-weight:600"; >Distancia recorrida</h4>
                <p style="margin-top:2%;">130.827,42 kms.<img src="./images/running.png" style="width: 20px; heigth: 20px; margin-left: 3%;"></p>
            </div>
            <div>
                <h4 style="margin:0; margin-top:6%; font-weight:600"; >Dias Totales de viaje</h4>
                <p style="margin-top:2%;">472<img src="./images/calendar.png" style="width: 20px; heigth: 20px; margin-left: 3%;"></p>
            </div>
            <div>
                <h4 style="margin:0; margin-top:6%; font-weight:600"; >Total de ciudades visitadas</h4>
                <p style="margin-top:2%;">32 <img src="./images/location.png" style="width: 20px; heigth: 20px; margin-left: 3%;"></p>
            </div>
            <div>
                <h4 style="margin:0; margin-top:6%; font-weight:600"; >Huella de carbono</h4>
                <p style="margin-top:2%;">9.21 CO<sub>2</sub> ton. <img src="./images/co2.png" style="width: 20px; heigth: 20px;"> </p>
            </div>

         <div class="boton_finalizar" style="margin-left: 25%; padding:3%">
            <a href="{BASE_URL}/" style="text-decoration:none; color:white; font-weight:500; font-size:16px">Salir</a>
         </div>
    </div>

    <script type="text/javascript" src="../js/behav.js"></script>
</body>
</html>
