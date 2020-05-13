document.addEventListener("DOMContentLoaded",function(){
    "use strict";

    console.log("Working -- 0");
    
    let logged = true;

    document.querySelector("#ingresar").addEventListener("click" , function(){
        mostrar_hidden_menu(false,0);
        logged = true;
    });
    
    document.querySelector("#registrarse").addEventListener("click" , function(){
        mostrar_hidden_menu(false,0);
        logged = true;
    });
    document.querySelector("#user_menu_cerrar_unlogged").addEventListener("click",function(){mostrar_hidden_menu(false,0)});

    document.querySelector("#menu_usuario").addEventListener("click", function(){mostrar_hidden_menu(true,0)});
    document.querySelector("#user_menu_cerrar_logged").addEventListener("click",function(){mostrar_hidden_menu(false,0)});
    
    document.querySelector("#agregar_viaje").addEventListener("click", function(){mostrar_hidden_menu(true,1)});
    document.querySelector("#new_menu_cerrar").addEventListener("click",function(){mostrar_hidden_menu(false,1)});
    

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

    mostrar_hidden_menu(false,0);
    logged=false;
    mostrar_hidden_menu(false,0);
    mostrar_hidden_menu(false,1);

});