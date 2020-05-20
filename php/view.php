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
    }
    