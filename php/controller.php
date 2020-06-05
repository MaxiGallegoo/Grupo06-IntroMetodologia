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
        private function redirectHeader(){
            header("Location : ".BASE_URL);
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



        //Testing model.
        /*
        public function testingModel_addHotel(){
            
            $time = getdate();
            $test_time = $time["hours"]."-".$time["minutes"]."-".$time["seconds"]; 
            $id_plan = $this->model->add_hotel("Hotel_Testing", "El Hardcodeado", $test_time, 1, 1, '2020-07-15', '2020-07-28', null, $test_time, "tipo_habit", "Servicios_hotel");
            echo "<br><br> Controller : add_hotel():id_plan = ". $id_plan;
            $get_hotel = $this->model->get_hotel($id_plan);
            echo "<br>". $get_hotel->id_plan ." - ".  $get_hotel->nombre_hotel ." - ".  $get_hotel->dir_hotel;
            
        }
        */
    }