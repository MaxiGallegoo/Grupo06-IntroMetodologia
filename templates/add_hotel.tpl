<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar nuevo plan</title>
    <link rel="stylesheet" href="../styles/master.css">
</head>
<body>
    <div class="content">
        <h2 id="title">Agregar un nuevo plan</h2>
        <img src="../images/screen.png">

        <label style="margin-top:10%" for="">Viaje</label><select name="" id="">
            <option value=""> - </option>
            <option value="">Negocios - Azul</option>
            <option value="">Negocios - Olavarria</option>
            <option value="">Negocios - La Plata</option>
            <option value="">Vacaciones - Punta del Este</option>
        </select>

        <label for="">Tipo de plan</label>
        <select name="" id="tipo_plan">
            <option value="1">Hotel</option>
        </select>

        <form action="" id="form_hidden_hotel">
            <label for="">Nombre del Hotel</label>
            <input type="text">
            <label for="">Direccion</label>
            <input type="text">
            <label for="">Cantidad de personas</label>
            <input type="number">
            <label for="">Cantidad de habitaciones</label>
            <input type="number">
            <label for="">Tipo de habitaciones</label>
            <input type="text">
            <label for="">Check in</label>
            <input type="date">
            <label for="">Check out</label>
            <input type="date">
                <label style="text-align:center; margin-bottom:5%; font-size:16px;">Servicios que provee</label>
                <label for="cbox1" style="width:95%;">Spa</label><br>
                <input style="width:5%;" type="checkbox" id="cbox1" value="desayuno"><label for="cbox2" style="width:95%;">Desayuno</label><br>
                <input style="width:5%;" type="checkbox" id="cbox2" value="estacionamiento"><label for="cbox3" style="width:95%;">Estacionamiento</label><br>
                <input style="width:5%;" type="checkbox" id="cbox3" value="wifi"><label for="cbox4" style="width:95%;">Wifi</label><br>
                <input style="width:5%;" type="checkbox" id="cbox4" value="servicio"><label for="cbox5" style="width:95%;">Servicio a la habitacion</label><br>
                <input style="width:5%;" type="checkbox" id="cbox5" value="otros"><label for="cbox6" style="width:95%;">Otros</label>
                <input style="width:5%;" type="checkbox" id="cbox6" value="firsttttt_checkbox">
        </form>

        <div class="boton_finalizar">
            <p>Guardar Plan</p>
        </div>

        <div class="boton_finalizar">
            <p>Cancelar</p>
        </div>

    </div>

    <script type="text/javascript" src="behav.js"></script>
</body>
</html>