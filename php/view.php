<?php
    require_once "libs/Smarty.class.php";
    class view{
        
		private $plantilla;

        public function __construct(){
            $this->plantilla = new Smarty();
        }

        public function displayIndex(){
            $this->plantilla->display("templates/index.tpl");
        }

        public function mostrar_estadisticas_globales($Estadisticas){
            $this->plantilla->assign('Estadisticas',$Estadisticas);
            $this->plantilla->display("templates/estadisticas_globales.tpl");
        }
		
		public function verMapa($id){
			if ($id==1){
				$punto1=[41.393206, 2.192809,"Hotel Marina Barcelona"];
				$punto3=[41.403573, 2.174639,"Sagrada Familia"];
				$punto2=[41.390942, 2.180909,"Arco triunfo"];
				$punto4=[41.392817, 2.200936,"Plaza Tirant"];
				$punto5=[41.399666, 2.214434,"Restaurante Boo"];
				$punto6=[41.411371, 2.220326,"Museo Cs. Naturales"];
				$lista=array($punto1,$punto2,$punto3,$punto4,$punto5,$punto6);	
			}
			else{
				$punto1=[-34.586476, -58.391889,"CC Recoleta"];
				$punto2=[-34.603660, -58.381881,"Obelisco"];
				$punto3=[-34.596083, -58.394227,"teatro Ateneo"];
				$punto4=[-34.582932, -58.419026,"Jardín Botánico"];
				$punto5=[-34.569849, -58.411462,"Planetario"];
				$punto6=[-34.587782, -58.388917,"Hotel Alvear"];
				$punto7=[-34.594159, -58.399666,"Restaurante Rapanui"];
				$lista=array($punto1,$punto2,$punto3,$punto4,$punto5,$punto6,$punto7);	
			}
			$this->plantilla->assign('lista',json_encode($lista));			
			$this->plantilla->display("map.tpl");
		}
    }
    