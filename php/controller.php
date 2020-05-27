<?php
    require_once "php/model.php";
    require_once "php/view.php";

    class controller{
        private $model;
        private $view;

        public function __construct(){
            $this->model = new model();
            $this->view = new view();
        }
		public function index(){
    		$this->view->displayIndex();
		}
		public function verMapa($params = null){
			$id=$params[":ID"];
    		$this->view->verMapa($id);
        }
        
        public function verEstadistica($params = null){
			$id=$params[":ID"];
            $this->view->verEstadisticas($id);
        }
        
		function InsertEstadistica(){
            $km_recorrido = $_POST["km_recorridos"];
            $cant_paises_visitados = $_POST["cant_paises_visitados "];
            $huella_carbono = $_POST["huella_carbono"];
            $horas_viajadas = $_POST["horas_viajadas"];
            if(isset($km_recorrido,$cant_paises_visitados,$huella_carbono,$horas_viajadas)){
              $this ->model ->InsertEstadistica($km_recorrido,$cant_paises_visitados,$huella_carbono,$horas_viajadas);
            }
        }
    }