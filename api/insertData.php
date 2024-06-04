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
				
		$A = $_GET['A'];
		$B = $_GET['B'];
		$C = $_GET['C'];
		$D = $_GET['C'];
		$E = $_GET['E'];
		$F = $_GET['F'];
		$G = $_GET['G'];
		$H = $_GET['H'];
		$I = $_GET['I'];
		$J = $_GET['J'];
		$K = $_GET['K'];
		$L = $_GET['L'];
		$M = $_GET['M'];
		$N = $_GET['N'];
		$O = $_GET['O'];
		$P = $_GET['P'];
		$Q = $_GET['Q'];
		$R = $_GET['R'];
		$S = $_GET['S'];
		
		
							
		$sql = "INSERT INTO `ungdata2`(`id`, `A`, `B`, `C`, `D`, `E`, `F`, `G`, `H`, `I`, `J`, `K`, `L`, `M`, `N`, `O`, `P`, `Q`, `R`, `S`) VALUES (Null,'$A','$B','$C','$D','$E','$F','$G','$H','$I','$J','$K','$L','$M','$N','$O','$P','$Q','$R','$S')";

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