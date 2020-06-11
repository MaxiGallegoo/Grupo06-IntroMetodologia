<?php

class model{

    private $db;
    private $tabla_estadisticas;
    private $tabla_plan;
    private $tabla_hotel;
    private $tabla_viaje;

    public function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_g6_metod;charset=utf8','root','');
        $this->tabla_estadisticas = "viaje_estadisticas";
        $this->tabla_plan = "plan";
        $this->tabla_hotel = "plan_hotel";
        $this->tabla_viaje = "viaje";

    }

    //GetEstadísticas() de un viaje específico.
    public function get_estadisticas_viaje($id_viaje){
        $sql = $this->db->prepare("SELECT * FROM ".$this->tabla_estadisticas." t WHERE t.viaje_id_viaje = ?");
        $sql->execute(array($id_viaje));
        return $sql->fetch(PDO::FETCH_ASSOC);
    }

    //GetEstadísticas() de todos los viajes.
    public function get_estadisticas_globales(){
        $sql = $this->db->prepare("SELECT * FROM ".$this->tabla_estadisticas);
        $sql->execute();
        return $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    //Los valores que pueden ser 'Null' pueden generar errores si no son seteados específicamente como 'Null' en la llamada a la función.
    public function add_hotel($titulo, $nombre_hotel, $direccion, $cant_personas, $cant_habitaciones, $in, $out, $id_viaje = null, $descripcion = null, $tipo_habitaciones = null, $servicios_hotel = null){

        //Conseguir id_viaje.
        if($id_viaje == null){

            $sql = $this->db->prepare("SELECT id_viaje FROM ". $this->tabla_viaje ." WHERE fecha_inicio<=? AND fecha_fin>=?");
            $sql->execute(array($in, $out));
            $id = $sql->fetchAll(PDO::FETCH_ASSOC);
            if(count($id) == 1 && isset($id["id_viaje"])){
                echo "<br><br> Esta Entrado al if ('valid viaje_id') <br><br>";
                $id_viaje = $id[0]["id_viaje"];
            }else{

                //HARDCODEADO PORQUE NO CORRESPONDE AL SPRINT.

                $sql = $this->db->prepare("INSERT INTO viaje (nombre, cod_pais_origen, cod_pais_destino, fecha_inicio, fecha_fin) VALUES ('ViajeGeneradoPorCreacionHotel', 'ARG', 'ARG', ?, ?)");
                $sql->execute(array($in, $out));

                //Recupero id de viaje para usarlo como FK de plan.
                $id_viaje = $this->db->lastInsertId();

                //Devuelvo '-1' en caso de fallo. MANEJAR EN CONTROLLER.
                if(!$id_viaje){
                    return -1;
                }

            }

        }

        //Cargo el hotel en planes generales.
        $sql = $this->db->prepare("INSERT INTO ". $this->tabla_plan ."(id_viaje,tipo,titulo,descripcion) VALUES (?,?,?,?)");
        $sql->execute(array($id_viaje, 1, $titulo, $descripcion));

        //Recupero id de plan (General) para usarlo como PK de plan_hotel.
        $id_plan = $this->db->lastInsertId();
        
        //Devuelvo '-1' en caso de fallo. MANEJAR EN CONTROLLER.
        if(!$id_plan){
            return -1;
        }
        
        //Cargo el hotel en su tabla.
        $sql = $this->db->prepare("INSERT INTO ". $this->tabla_hotel ."(id_plan, nombre_hotel, dir_hotel, cant_personas, cant_habitaciones, tipo_habitaciones, servicios,fecha_in, fecha_out) VALUES (?,?,?,?,?,?,?,?,?)");
        $sql->execute(array($id_plan,$nombre_hotel, $direccion, $cant_personas, $cant_habitaciones, $tipo_habitaciones, $servicios_hotel, $in, $out));
        

        //Devuelvo id_plan para corfimar la inserción en el controller y en caso que quiera usarse para link en el tpl.
        return $id_plan;
    }

    public function get_hotel($id_plan){
        //Select from tabla_hotel 1 / 0 hoteles con esa id unica.
        $sql = $this->db->prepare("SELECT * FROM ". $this->tabla_hotel ." WHERE (id_plan = ?)");
        $sql->execute(array($id_plan));
        return $sql->fetch(PDO::FETCH_OBJ);
    }
    
    public function get_titulo_plan($id_plan){
        //Select from tabla_hotel 1 / 0 hoteles con esa id unica.
        $sql = $this->db->prepare("SELECT titulo FROM ". $this->tabla_plan ." WHERE (id_plan = ?)");
        $sql->execute(array($id_plan));
        return $sql->fetch(PDO::FETCH_OBJ);
    }
    public function add_hotel_test($id_viaje, $titulo, $desc){

        $sql = $this->db->prepare("INSERT INTO ". $this->tabla_plan ."(´viaje_id_viaje´,´tipo´,´titulo´,´descripcion´,´latitud´,´longitud´) VALUES (?,?,?,?,?,?)");
        $sql->execute(array($id_viaje, 1, $titulo, $desc,null,null));

    }

}
