<?php
    require_once "php/model.php";
    require_once "php/view.php";
    require_once "php/isset_helper.php";

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
        
		public function InsertEstadistica(){
            $km_recorrido = $_POST["km_recorridos"];
            $cant_paises_visitados = $_POST["cant_paises_visitados "];
            $huella_carbono = $_POST["huella_carbono"];
            $horas_viajadas = $_POST["horas_viajadas"];
            if(isset($km_recorrido,$cant_paises_visitados,$huella_carbono,$horas_viajadas)){
              $this ->model ->InsertEstadistica($km_recorrido,$cant_paises_visitados,$huella_carbono,$horas_viajadas);
            }
        }

    //Recive id_viaje como parámetro en caso que el insert se realice desde un viaje ya creado, pero también funciona llamando la función sin parámetros.
    //Los valores que pueden ser 'Null' generan error en el validData(), habría que establecer un 'equivalente' a null.
        public function insertHotel($id_viaje = null){

            /*
            
            $this->view->display_cargando();

            */ 

            if(validData($id_viaje, array(":ID"))){
                $id_viaje = $id_viaje[":ID"];
            }


            //Ininializa en 0 para que, en caso que no sea modificado, falle el if;
            $id_hotel = 0;
            // isset_helpet->validData($arr , $keys);
            // [IMPORTANTE] Las keys dentro del array deben ser iguales a los nombres de los inputs del .tpl.
            if(validData(null /* $_POST */ , array("titulo","nombre_hotel","direccion_hotel","cant_personas","cant_habitaciones","fecha_in","fecha_out","descripcion","tipo_habitaciones","servicios_hotel"))){
                
                $id_hotel = $this->model->add_hotel($_POST['titulo'],$_POST['nombre_hotel'],$_POST['direccion_hotel'],$_POST['cant_personas'],$_POST['cant_habitaciones'],$_POST['fecha_in'],$_POST['fecha_out'], $id_viaje ,$_POST['descripcion'],$_POST['tipo_habitaciones'],$_POST['servicios_hotel']);
            }else{
                //Error en carga de datos.
                $id_hotel = -2; //-2 para diferenciarlo del error en el model/DB.
            }

            /*

            //Si id_hotel es menor a 1, entonces falló el insert.
            if($id_hotel>0){
                $titulo = $this->model->get_titulo_plan($id_hotel);
                $this->view->display_success_add_hotel($titulo);
            }else{
                $this->view->display_fail_add_hotel();
            }
            */


            
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