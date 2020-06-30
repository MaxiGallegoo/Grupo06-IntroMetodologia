<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Principal</title>
    
    <link rel="stylesheet" href="styles/index_style.css">
</head>
<body>

    <div id="hidden-new-menu">
        <img src="img/index/cerrar.png" id="new_menu_cerrar" alt="">
        <div class="hidden_menu_option top">

            <img src="img/index/nuevo_viaje.png" class="hidden_menu_icon" alt="">
            <div class="hidden_menu_title">
                <h2>Crear un nuevo viaje</h2>
            </div>
            <div class="hidden_menu_option_desc">
                <p>[Descripcion] Lorem ipsum dolor sit, amet consectetur adipisicing elit. Adipisci, tenetur, hic reprehenderit quae est ad laudantium velit accusamus ipsum nam reiciendis quo tempora nisi voluptatum, fuga necessitatibus? Dolores, incidunt aut?</p>
            </div>

        </div>
        <div class="hidden_menu_option bot">

            <img src="img/index/nuevo_plan.png" id="js-new_hotel" class="hidden_menu_icon" alt="">
            <div class="hidden_menu_title">
                <h2>Cargar un nuevo plan</h2>
            </div>
            <div class="hidden_menu_option_desc">
                <p>[Descripcion] Lorem ipsum dolor sit, amet consectetur adipisicing elit. Adipisci, tenetur, hic reprehenderit quae est ad laudantium velit accusamus ipsum nam reiciendis quo tempora nisi voluptatum, fuga necessitatibus? Dolores, incidunt aut?</p>
            </div>

        </div>

    </div>
    <div id="hidden-user-menu-unlogged">
        <img src="img/index/cerrar.png" id="user_menu_cerrar_unlogged" alt="">
        <div class="hidden_menu_option top">

            <img src="img/index/login_user.png" class="hidden_menu_icon" alt="">
            <div class="hidden_menu_title">
                <h2>Ingresar</h2>
            </div>
            <div class="hidden_menu_option_desc hidden-user-menu-form">
                <label for="">Usuario:</label>
                <input type="text" value="user_ejemplo">
                <label for="">Contrase&ntildea:</label>
                <input type="password" value="user_ejemplo">
                <input id="ingresar" type="button" value="Ingresar">
            </div>

        </div>
        <div class="hidden_menu_option bot">

            <img src="img/index/crear_nuevo_usuario.png" class="hidden_menu_icon" alt="">
            <div class="hidden_menu_title">
                <h2>Registrarse</h2>
            </div>
            <div class="hidden_menu_option_desc hidden-user-menu-form">
                <label for="">Nuevo usuario:</label>
                <input type="text" value="user_ejemplo">
                <label for="">Nueva contrase&ntildea:</label>
                <input type="password" value="user_ejemplo">
                <label for="">Escribe la contrase&ntildea nuevamente:</label>
                <input type="password" value="user_ejemplo">
                <input id="registrarse" type="button" value="registrarse">
            </div>

        </div>


    </div>
    <div id="hidden-user-menu-logged">
        <img src="img/index/cerrar.png" id="user_menu_cerrar_logged" alt="">
        <div class="hidden_menu_option top">

            <img src="img/index/configuracion_user.png" class="hidden_menu_icon" alt="">
            <div class="hidden_menu_title">
                <h2>Configuraci&oacuten de Usuario</h2>
            </div>
            <div class="hidden_menu_option_desc">
                <p>[Descripcion] Lorem ipsum dolor sit, amet consectetur adipisicing elit. Adipisci, tenetur, hic reprehenderit quae est ad laudantium velit accusamus ipsum nam reiciendis quo tempora nisi voluptatum, fuga necessitatibus? Dolores, incidunt aut?</p>
            </div>

        </div>
        <div class="hidden_menu_option bot">

            <img src="img/index/comprar_premium.png" class="hidden_menu_icon" alt="">
            <div class="hidden_menu_title">
                <h2>Pasarse a Premium</h2>
            </div>
            <div class="hidden_menu_option_desc">
                <p>[Descripcion] Lorem ipsum dolor sit, amet consectetur adipisicing elit. Adipisci, tenetur, hic reprehenderit quae est ad laudantium velit accusamus ipsum nam reiciendis quo tempora nisi voluptatum, fuga necessitatibus? Dolores, incidunt aut?</p>
            </div>

        </div>


    </div>

    
    <div class="content">
        <div class="sub_content" id="agregar_viaje">
            <img class="sub_content_image" id="add_viaje_icon"  src="img/index/new.png" alt="">

        </div>
        <div id="historial_viajes">
            <h2>Estadisticas</h2>
        </div>
        <div class="sub_content" id="menu_usuario">

            <img class="sub_content_image" id="user_menu_icon" src="img/index/user.png" alt="">
        </div>

    </div>
    <div class="espacio"></div>
    <div class="viajes" id="viajes_db">
        {if $viajes != 0}
            <h1 class="viajes_title">Futuros viajes</h1>
            {foreach from=$viajes item=$v}
                <div class="viaje_individual">    
                    <h2>{$v->nombre}</h2>
                    <p>Desde {$v->fecha_inicio} hasta {$v->fecha_fin}</p>
                    <!--Debería traer los titulos de los planes y meterlos en el mismo div-->
                </div>
            {/foreach}
        {else}
            <h1 class="viajes_title">No hay viajes planeados</h1>
        {/if}
    </div>

    {if $nuevos_hoteles==0}
    <div class="hidden" id="notificaciones">
    {else}
    <div id="notificaciones">
    {/if}
        <img src="img/index/cerrar.png" id="notificaciones_cerrar" alt="">

        {if sizeof($nuevos_hoteles) == 1}
        <h2 id="h2_notif">La siguiente reserva de hotel se registr&oacute correctamente:</h2>
        {else}
        <h2 id="h2_notif">Las siguientes reservas de hotel se registraron correctamente:</h2>
        {/if}
        {foreach from=$nuevos_hoteles item=$h}
            <p class="p_notif">Reserva en hotel "{$h->nombre_hotel}"</p>
        {/foreach}
    </div>

    <script type="text/javascript" src="js/behav.js"></script>







    <!--PÁGINA DE PORTADA
	</br><a href="{BASE_URL}/mapa/1">Ver viaje 1</a>
	</br><a href="{BASE_URL}/mapa/2">Ver viaje 2</a>
    </br><a href="{BASE_URL}/estadistica/1">Estadistica global 1</a>
	</br><a href="{BASE_URL}/estadistica/2">Estadistica global 2</a>
    </br><a href="{BASE_URL}/hotel/nuevo">Agregar reserva de hotel</a>
    -->
</body>
</html>