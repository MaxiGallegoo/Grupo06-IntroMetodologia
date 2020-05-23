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
    }
    