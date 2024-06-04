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
				
		$serviceid = $_GET['serviceid'];
		$parity = $_GET['parity'];
		$swinecode = $_GET['swinecode'];
		$codeleft = $_GET['codeleft'];
		$coderight = $_GET['coderight'];
		$birthlot = $_GET['birthlot'];
		$birthdate = $_GET['birthdate'];
		$farrowtime = $_GET['farrowtime'];
		$swinebreed = $_GET['swinebreed'];
		$damcode = $_GET['damcode'];
		$sirecode = $_GET['sirecode'];
		$birthweigth = $_GET['birthweigth'];
		$mummylength = $_GET['mummylength'];
		$weight = $_GET['weight'];
		$weandate = $_GET['weandate'];
		$deathdate = $_GET['deathdate'];
		$vasectomytype = $_GET['vasectomytype'];
		$livestockstatusid = $_GET['livestockstatusid'];
		$swinebreederswinecode = $_GET['swinebreederswinecode'];
		$househouseno = $_GET['househouseno'];
		$farmfarmcode = $_GET['farmfarmcode'];
		$officeofficecode = $_GET['officeofficecode'];
		$branchbranchcode = $_GET['branchbranchcode'];
		$flock= $_GET['flock'];
		$farmgrade = $_GET['farmgrade'];
		$gendergendercode = $_GET['gendergendercode'];
		$livestockcodelivestockcode = $_GET['livestockcodelivestockcode'];
		$livestockgradelivestockgrade = $_GET['livestockgradelivestockgrade'];
		$swinepiglethealthpiglethealthtext = $_GET['swinepiglethealthpiglethealthtext'];
		
		
		
		
							
		$sql = "INSERT INTO `SwineCodeJi`(`id`, `serviceid`, `parity`, `swinecode`, `codeleft`, `coderight`, `birthlot`, `birthdate`, `farrowtime`, `swinebreed`, `damcode`, `sirecode`, `birthweigth`, `mummylength`, `weight`, `weandate`, `deathdate`, `vasectomytype`, `livestockstatusid`, `swinebreederswinecode`, `househouseno`, `farmfarmcode`, `officeofficecode`, `branchbranchcode`, `flock`, `farmgrade`, `gendergendercode`, `livestockcodelivestockcode`, `livestockgradelivestockgrade`, `swinepiglethealthpiglethealthtext`) VALUES (Null, '$serviceid', '$parity', '$swinecode', '$codeleft', '$coderight', '$birthlot', '$birthdate', '$farrowtime', '$swinebreed', '$damcode', '$sirecode', '$birthweigth', '$mummylength', '$weight', '$weandate', '$deathdate', '$vasectomytype', '$livestockstatusid', '$swinebreederswinecode', '$househouseno', '$farmfarmcode', '$officeofficecode', '$branchbranchcode', '$flock', '$farmgrade', '$gendergendercode', '$livestockcodelivestockcode', '$livestockgradelivestockgrade', '$swinepiglethealthpiglethealthtext')";

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