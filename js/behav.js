"use strict";
document.addEventListener("DOMContentLoaded",function(){
    let urlbase=document.querySelector("#url_base").innerHTML;
    
    let logged = true;

    document.querySelector("#ingresar").addEventListener("click" , function(){
        mostrar_hidden_menu(false,0);
        logged = true;
    });

    document.querySelector("#js-new_hotel").addEventListener("click" , function(){add_hotel()});
    
    document.querySelector("#registrarse").addEventListener("click" , function(){
        mostrar_hidden_menu(false,0);
        logged = true;
    });
    document.querySelector("#notificaciones_cerrar").addEventListener("click",function(){mostrar_hidden_menu(false,2)});
    document.querySelector("#user_menu_cerrar_unlogged").addEventListener("click",function(){mostrar_hidden_menu(false,0)});

    document.querySelector("#menu_usuario").addEventListener("click", function(){mostrar_hidden_menu(true,0)});
    document.querySelector("#user_menu_cerrar_logged").addEventListener("click",function(){mostrar_hidden_menu(false,0)});
    
    document.querySelector("#agregar_viaje").addEventListener("click", function(){mostrar_hidden_menu(true,1)});
    document.querySelector("#new_menu_cerrar").addEventListener("click",function(){mostrar_hidden_menu(false,1)});
    
    document.querySelector("#historial_viajes").addEventListener("click",function(){location.replace(urlbase+"/estadistica")});
    
    //document.querySelector("#btn_cancelar").addEventListener("click", go_index);
    

    function mostrar_hidden_menu(mostrar,id_menu){
        console.log("mostrar_hidden_menu --- 0");
        console.log("mostrar = " + mostrar);
        
        
        let menu;
        switch(id_menu){

            
            case 0: 
            console.log("switch debug --- 0.0");
            if(logged) menu =  document.querySelector("#hidden-user-menu-logged");
            else menu =  document.querySelector("#hidden-user-menu-unlogged");
            console.log("switch debug --- 1.0");

            break;
            case 1: menu = document.querySelector("#hidden-new-menu");
            break;

            case 2:menu = document.querySelector("#notificaciones");
            break;
        }
        console.log("mostrar_hidden_menu --- 1");
        console.log(menu);
        
        if(mostrar){
            console.log("mostrar_hidden_menu --- 2.display");
            document.body.classList.add("hidden_overflow");
            menu.classList.remove("hidden");
        }else{
            console.log("mostrar_hidden_menu --- 2.hidden");
            document.body.classList.remove("hidden_overflow");
            menu.classList.add("hidden");
        }
        console.log("mostrar_hidden_menu --- 3");

    }

    function add_hotel(){
        let currentURL = window.location.href;
        let newURL = "hotel/nuevo";
        if(currentURL[currentURL.length-1]!='/'){
            newURL = "/"+newURL;
        }

        location.replace(currentURL+newURL);
    
    }

    mostrar_hidden_menu(false,0);
    logged=false;
    mostrar_hidden_menu(false,0);
    mostrar_hidden_menu(false,1);

    function go_index(){
        console.log("Cancela");
    }

});