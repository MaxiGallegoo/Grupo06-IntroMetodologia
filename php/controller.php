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
        public function displayAddHotel(){
            $this->view->addHotel();
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
		
		public function palabraClave($in){
            if (strcasecmp($in, "nombre_hotel:")==0){
                return true;
            }
            if (strcasecmp($in, "direccion_hotel:")==0){
                return true;
            }
            if (strcasecmp($in, "cant_personas:")==0){
                return true;
            }
            if (strcasecmp($in, "cant_habitaciones:")==0){
                return true;
            }
            if (strcasecmp($in, "fecha_in:")==0){
                return true;
            }
            if (strcasecmp($in, "fecha_out:")==0){
                return true;
            }
            if (strcasecmp($in, "descripcion:")==0){
                return true;
            }
            if (strcasecmp($in, "tipo_habitaciones:")==0){
                return true;
            }
            if (strcasecmp($in, "servicios_hotel:")==0){
                return true;
            }
            if (strcasecmp($in, "latitud:")==0){
                return true;
            }
            if (strcasecmp($in, "longitud:")==0){
                return true;
            }
            return false;
		}

    	public function leerMail($params = null){
            $mail=$_POST['cuerpo'];
            $correo=$_POST['mail'];
			$arreglo=explode(" ",$mail);
            $i=0;
            $nombre_hotel="";$direccion_hotel="";$cant_personas="";$cant_habitaciones="";$fecha_in="";$fecha_out="";$descripcion="";
            $tipo_habitaciones="";$servicios_hotel="";$latitud="";$longitud="";
            $cantPasadas=0;
            while ($i<count($arreglo)&&$cantPasadas<=10000){
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "nombre_hotel:")==0){
                        $i++;
                        while ($i<count($arreglo)&&($this->palabraClave($arreglo[$i])==false)){
                            $nombre_hotel=$nombre_hotel.$arreglo[$i]." ";
                            $i++;
                        }
                        $nombre_hotel=substr($nombre_hotel,0,strlen($nombre_hotel)-1);
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "direccion_hotel:")==0){
                        $i++;
                        while ($i<count($arreglo)&&($this->palabraClave($arreglo[$i])==false)){
                            $direccion_hotel=$direccion_hotel.$arreglo[$i]." ";
                            $i++;
                        }
                        $direccion_hotel=substr($direccion_hotel,0,strlen($direccion_hotel)-1);
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "cant_personas:")==0){
                        $i++;
                        $cant_personas=$arreglo[$i];
                        $i++;
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "cant_habitaciones:")==0){
                        $i++;
                        $cant_habitaciones=$arreglo[$i];
                        $i++;
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "fecha_in:")==0){
                        $i++;
                        $fecha_in=$arreglo[$i];
                        $i++;    
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "fecha_out:")==0){
                        $i++;
                        $fecha_out=$arreglo[$i];
                        $i++;
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "descripcion:")==0){
                        $i++;
                        while ($i<count($arreglo)&&($this->palabraClave($arreglo[$i])==false)){
                            $descripcion=$descripcion.$arreglo[$i]." ";
                            $i++;
                        }
                        $descripcion=substr($descripcion,0,strlen($descripcion)-1);
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "tipo_habitaciones:")==0){
                        $i++;
                        while ($i<count($arreglo)&&($this->palabraClave($arreglo[$i])==false)){
                            $tipo_habitaciones=$tipo_habitaciones.$arreglo[$i]." ";
                            $i++;
                        }
                        $tipo_habitaciones=substr($tipo_habitaciones,0,strlen($tipo_habitaciones)-1);
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "servicios_hotel:")==0){
                        $i++;
                        while ($i<count($arreglo)&&($this->palabraClave($arreglo[$i])==false)){
                            $servicios_hotel=$servicios_hotel.$arreglo[$i].", ";
                            $i++;
                        }
                        $servicios_hotel=substr($servicios_hotel,0,strlen($servicios_hotel)-2);
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "latitud:")==0){
                        $i++;
                        $latitud=$arreglo[$i];
                        $i++;
                    }
                }
                if ($i<count($arreglo)){
                    if (strcasecmp($arreglo[$i], "longitud:")==0){
                        $i++;
                        $longitud=$arreglo[$i];
                        $i++;
                    }
                }

                $cantPasadas++;
            }
			
			//Enviar a la función insertHotel las variables extraídas del correo 
            echo $correo."<br>";
            echo $nombre_hotel."<br>";
            echo $direccion_hotel."<br>";
            echo $cant_personas."<br>";
            echo $cant_habitaciones."<br>";
            echo $fecha_in."<br>";
            echo $fecha_out."<br>";
            echo $descripcion."<br>";
            echo $tipo_habitaciones."<br>";
            echo $servicios_hotel."<br>";
            echo $latitud."<br>";
            echo $longitud."<br>";
		}
	
	}