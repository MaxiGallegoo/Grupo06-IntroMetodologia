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
            <h4>Estadisticas Del Viaje</h4>
            <ul class="list-group">
                <li class="list-group-item"> Km Recorridos: {$Estadistica->km_recorridos}</li>
                <li class="list-group-item"> Países visitados: {$Estadistica->cant_paises_visitados}</li>
                <li class="list-group-item"> Huella Carbono: {$Estadistica->huella_carbono}</li>
                <li class="list-group-item"> Horas viajadas: {$Estadistica->horas_viajadas}</li>
            </ul>
        </div>
    </body>
</html>
