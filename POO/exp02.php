<?php
	class carro{
		private $modelo;
		private $motor;
		private $ano;

		public function getModelo(){
			return $this->modelo;
		}
		public function setModelo($value){
			$this->modelo = $value;
		}
		public function getMotor():float{
			return $this->motor;
		}
		public function setMotor($value){
			$this->motor = $value;
		}
		public function getAno():int{
			return $this->ano;
		}
		public function setAno($value){
			$this->ano = $value;
		}
		public function exibir(){
			return array(
				"modelo"=>$this->getModelo(),
				"motor"=>$this->getMotor(),
				"ano"=>$this->getAno()
			);
		}
	}
	$gol = new carro();
	$gol->setModelo("Gol GT");
	$gol->setMotor("1.6");
	$gol->setAno("2017");
	print_r($gol->exibir());
	echo "<br>";
	var_dump($gol->exibir());
?>