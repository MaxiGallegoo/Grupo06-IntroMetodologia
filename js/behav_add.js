
document.querySelector("#btn_cancelar").addEventListener("click", go_index);
document.querySelector("#btn_add").addEventListener("click", add_hotel);
let urlbase=document.querySelector("#url_base").innerHTML;

function add_hotel(){
    let selector= document.querySelector("#viajeSelect");
    let idviaje=selector.value;
    let titulo=selector.options[selector.selectedIndex].innerHTML;
    let nom_hotel=document.querySelector("#nom_hotel").value;
    let direccion=document.querySelector("#direccion").value;
    let cant_personas=document.querySelector("#cant_personas").value;
    let cant_hab=document.querySelector("#cant_hab").value;
    let tipo_hab=document.querySelector("#tipo_hab").value;
    let fecha_in=document.querySelector("#fecha_in").value;
    let fecha_out=document.querySelector("#fecha_out").value;
    let latitud=document.querySelector("#lat").value;
    let longitud=document.querySelector("#long").value;
    let descripcion=document.querySelector("#descripcion").value;
    let servicios="";
    let serv1=document.querySelector("#cbox1");
    if (serv1.checked)
        servicios+=serv1.value+" ";
    let serv2=document.querySelector("#cbox2");
    if (serv2.checked)
        servicios+=serv2.value+" ";
    let serv3=document.querySelector("#cbox3");
    if (serv3.checked)
        servicios+=serv3.value+" ";
    let serv4=document.querySelector("#cbox4");
    if (serv4.checked)
        servicios+=serv4.value+" ";
    let serv5=document.querySelector("#cbox5");
    if (serv5.checked)
        servicios+=serv5.value+" ";
    let serv6=document.querySelector("#cbox6");
    if (serv6.checked)
        servicios+=serv6.value+" ";
    makePost(idviaje, titulo, nom_hotel, direccion, cant_personas, cant_hab, tipo_hab, fecha_in, fecha_out, latitud, longitud, servicios, descripcion);
}

function makePost(idviaje,titulo, nom_hotel, direccion, cant_personas, cant_hab, tipo_hab,  fecha_in, fecha_out, latitud, longitud, servicios, descripcion){
    const form = document.createElement('form');
    form.method = "POST";
    form.action = urlbase+"/hotel/nuevo/"+idviaje;
    let hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "titulo";
        hiddenField.value = titulo;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "nombre_hotel";
        hiddenField.value = nom_hotel;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "direccion_hotel";
        hiddenField.value = direccion;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "cant_personas";
        hiddenField.value = cant_personas;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "cant_habitaciones";
        hiddenField.value = cant_hab;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "fecha_in";
        hiddenField.value = fecha_in;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "fecha_out";
        hiddenField.value = fecha_out;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "descripcion";
        hiddenField.value = descripcion;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "tipo_habitaciones";
        hiddenField.value = tipo_hab;
    form.appendChild(hiddenField);
    hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "servicios_hotel";
        hiddenField.value = servicios;
    form.appendChild(hiddenField);
        hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "latitud";
        hiddenField.value = latitud;
    form.appendChild(hiddenField);
        hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "longitud";
        hiddenField.value = longitud;
    form.appendChild(hiddenField);
    document.body.appendChild(form);
    form.submit();
}


function go_index(){
    location.replace(urlbase);
}