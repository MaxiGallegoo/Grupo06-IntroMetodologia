<?php

    //Revisa si el array pasado como parámetro esta seteado.
    //[IMPORTANTE] para revisar el array $_POST, hay que enviar el parámetro $arr como 'Null'.
    function validData($arr=null,$keys=null){
        if($arr==null){
            foreach($keys as $k){
                if( !isset($_POST[$k]) || $_POST[$k]=='' ){
                    return "false";
                }
            }
        }else{
            foreach($keys as $k){
                if( !isset($arr[$k]) || $arr[$k]=='' ){
                    return "false";
                }
            }
        }
        return true;
    }