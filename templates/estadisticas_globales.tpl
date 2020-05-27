<!DOCTYPE html>
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
            {foreach from=$Estadisticas item=estadistica}
            <li class="list-group-item"> Km Recorridos: {$estadistica['km_recorrido']} - Cantidad Paises Visitados: $ {$estadistica['cant_paises_visitados']} - huella carbono: {$estadistica['huella_carbono']} - Horas Viajadas: {$estadistica['horas_viajadas']}</li>
            {/foreach}
            </ul>
        </div>
    </body>
</html>
