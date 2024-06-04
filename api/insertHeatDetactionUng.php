<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$swineCode = $_GET['swineCode'];
		$farmFarmCode = $_GET['farmFarmCode'];
		$age = $_GET['age'];
		$listCaseAnimals = $_GET['listCaseAnimals'];
		$startTime = $_GET['startTime'];
		$finishTime = $_GET['finishTime'];
		$recorder = $_GET['recorder'];
		$inspector = $_GET['inspector'];
		$weight = $_GET['weight'];
		$breastLeft = $_GET['breastLeft'];
		$breastRight = $_GET['breastRight'];
		$pen = $_GET['pen'];
		
		
							
		$sql = "INSERT INTO `heatDetactionUng`(`id`, `swineCode`, `farmFarmCode`, `age`, `listCaseAnimals`, `startTime`, `finishTime`, `recorder`, `inspector`, `weight`, `breastLeft`, `breastRight`, `pen`) VALUES (Null,'$swineCode','$farmFarmCode','$age','$listCaseAnimals','$startTime','$finishTime','$recorder','$inspector','$weight','$breastLeft','$breastRight','$pen')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master UNG";
   
}
	mysqli_close($link);
?>