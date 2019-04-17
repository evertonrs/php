<?php
	class pessoa{
		public $nome;//atributo
		public function falar(){//metodo
			return "O meu  nome e ".$this->nome;//this "essa classe"
		}
	}
	$derp = new pessoa();
	$derp->nome= "derp depino";
	$derp->falar();
	echo $derp->falar();
?>