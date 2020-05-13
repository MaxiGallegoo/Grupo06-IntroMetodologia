document.addEventListener("DOMContentLoaded",function(){
    "use strict";

    let vuelo = document.querySelector("#form_hidden_vuelo");
    let hotel = document.querySelector("#form_hidden_hotel");
    let titulo = document.querySelector("#input_titulo_plan");
    console.log("Working -- 0");
    
    let select_tag = document.querySelector("#tipo_plan");
    select_tag.addEventListener("change", function(){mostrar_hidden_menu()});
    

    function mostrar_hidden_menu(){
        console.log("Mostrar_hidden_manu --- 0");
        
        let v = select_tag.value;
        console.log("select_tag.value = " + v);
        

        switch(v){
            case '0': 
                vuelo.classList.add("hidden");
                hotel.classList.add("hidden");
                document.body.style.height = "620px";
                titulo.placeholder = "EjemploPlan";
                console.log("Mostrar_hidden_manu --- 1.0");
                break;
            case '1':
                vuelo.classList.remove("hidden");
                hotel.classList.add("hidden");
                document.body.style.height = "710px";
                titulo.placeholder = "VueloEjemplo (Origen , Destino)";
                console.log("Mostrar_hidden_manu --- 1.1");
                break;
            case '2':
                vuelo.classList.add("hidden");
                hotel.classList.remove("hidden");
                document.body.style.height = "620px";
                titulo.placeholder = "Reserva en Hotel 'Ejemplo'";
                console.log("Mostrar_hidden_manu --- 1.2");
                break;
            default:
                vuelo.classList.add("hidden");
                hotel.classList.add("hidden");
                document.body.style.height = "620px";
                titulo.placeholder = "EjemploPlan";
                console.log("Mostrar_hidden_manu --- 1.4");
                break;

        }
        console.log("Mostrar_hidden_manu --- 2");


    }

    mostrar_hidden_menu();

});