<?php

class planes_model{

    private $db;
    private $tabla_estadisticas;

    public function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_g6_metod;charset=utf8','root','');
        $this->tabla_estadisticas = "viaje_estadistica";
    }

    //GetEstadísticas() de un viaje específico.
    public function get_estadisticas_viaje($id_viaje){
        $sql = $this->db->prepare("SELECT * FROM ".$this->tabla_estadisticas." t WHERE t.id_viaje = ?");
        $sql->execute(array($id_viaje));
        return $sql->fetch(PDO::FETCH_OBJ);
    }

}