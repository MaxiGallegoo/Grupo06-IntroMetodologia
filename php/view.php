<?php
    require_once "libs/Smarty.class.php";
    class view{
        
		private $plantilla;

        public function __construct(){
            $this->plantilla = new Smarty();
        }

        public function displayIndex($viajes=null, $nuevos_hoteles=null){
			
			if($nuevos_hoteles && count($nuevos_hoteles)!=0){
				$this->plantilla->assign('nuevos_hoteles',$nuevos_hoteles);
			}else{
				$this->plantilla->assign('nuevos_hoteles',0);
			}
			if($viajes && count($viajes)!=0){
				$this->plantilla->assign('viajes',$viajes);
			}else{
				$this->plantilla->assign('viajes',0);
			}

            $this->plantilla->display("templates/index.tpl");
        }

        public function mostrar_estadisticas_globales($Estadisticas){
            $this->plantilla->assign('Estadisticas',$Estadisticas);
            $this->plantilla->display("templates/estadisticas_globales.tpl");
		}
		
		public function mostrar_estadistica($Estadistica){
			//var_dump($Estadistica);
            $this->plantilla->assign('Estadistica',$Estadistica);
            $this->plantilla->display("templates/estadisticas.tpl");
		}
		// public function verEstadisticas($id){
		// 	if($id==1){
		// 		$this->plantilla->assign('Estadistica',$Estadistica);
		// 		$this->plantilla->display("templates/estadistica.tpl");
		// 	}
		// 	else{
		// 		$this->plantilla->assign('Estadistica',$Estadistica);
		// 		$this->plantilla->display("templates/estadistica2.tpl");
		// 	}
		// }
		public function verMapa($planes){
			$lista=[];
			foreach ($planes as $plan) {
				$punto=[$plan->latitud, $plan->longitud, $plan->titulo, $plan->descripcion];
				array_push($lista,$punto);
			}
			$this->plantilla->assign('lista',json_encode($lista));			
			$this->plantilla->display("map.tpl");
		}

		public function addHotel($viajes=null){
			if(!$viajes){
				$viajes = 0;
			}
			$this->plantilla->assign('viajes',$viajes);
			$this->plantilla->display("templates/add_hotel.tpl");
		}
		public function procesando(){
			$this->plantilla->display("templates/procesando.tpl");
		}
    }
    