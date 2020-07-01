<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar nuevo plan</title>
    <link rel="stylesheet" href="../styles/master.css">
</head>
<body>
    <p style="visibility:hidden;" id="url_base">{BASE_URL}</p>;
    <div class="content">
        <h2 id="title">Agregar un nuevo plan</h2>
        <img src="../images/screen.png">

        <label style="margin-top:10%" for="">Viaje</label>
        <select name="" id="viajeSelect">
             <option value="-1"> - </option>
            {if $viajes!=0}
                {foreach from=$viajes item=$v}
                    <option value="{$v->id_viaje}"> {$v->nombre} </option>
                {/foreach}
            {/if}
        </select>

        <label for="">Tipo de plan</label>
        <select name="" id="tipo_plan">
            <option value="1">Hotel</option>
        </select>

        <form action="" id="form_hidden_hotel">
            <label for="">Nombre del Hotel</label>
            <input type="text" id="nom_hotel">
            <label for="">Direccion</label>
            <input type="text" id="direccion">
            <label for="">Latitud</label>
            <input type="text" id="lat">
            <label for="">Longitud</label>
            <input type="text" id="long">
            <label for="">Cantidad de personas</label>
            <input type="number" id="cant_personas">
            <label for="">Cantidad de habitaciones</label>
            <input type="number" id="cant_hab">
            <label for="">Tipo de habitaciones</label>
            <input type="text" id="tipo_hab">
            <label for="">Check in</label>
            <input type="date" id="fecha_in">
            <label for="">Check out</label>
            <input type="date" id="fecha_out">
            <label style="text-align:center; margin-bottom:5%; font-size:16px;">Servicios que provee</label>
            <div id="servicios">
                <label for="cbox1" style="width:95%;">Spa</label><br>
                    <input style="width:5%;" type="checkbox" id="cbox1" value="Spa" class="clase_servicios">
                <label for="cbox2" style="width:95%;">Desayuno</label><br>
                    <input style="width:5%;" type="checkbox" id="cbox2" value="Desayuno" class="clase_servicios">
                <label for="cbox3" style="width:95%;">Estacionamiento</label><br>
                    <input style="width:5%;" type="checkbox" id="cbox3" value="Estacionamiento" class="clase_servicios">
                <label for="cbox4" style="width:95%;">Wifi</label><br>
                    <input style="width:5%;" type="checkbox" id="cbox4" value="Wifi" class="clase_servicios">
                <label for="cbox5" style="width:95%;">Servicio a la habitacion</label><br>
                    <input style="width:5%;" type="checkbox" id="cbox5" value="Servicio a la habitacion" class="clase_servicios">
                <label for="cbox6" style="width:95%;">Otros</label><br>
                    <input style="width:5%;" type="checkbox" id="cbox6" value="Otros" class="clase_servicios">
            </div>
            <label for="">Descripcion</label>
            <input type="text" id="descripcion">
        </form>

        <div class="boton_finalizar" id="btn_add">
            <p>Guardar Plan</p>
        </div>

        <div class="boton_finalizar" id="btn_cancelar">
            <p>Cancelar</p>
        </div>

    </div>

    <script type="text/javascript"  src="../js/behav_add.js"></script>
</body>
</html>