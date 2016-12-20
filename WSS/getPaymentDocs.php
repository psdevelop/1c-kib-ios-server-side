<?php 

//require_once(__DIR__."/configuration.php");
$wss_base = "http://localhost/FinansDemo/ws/PaymentDocs?wsdl";
//include __DIR__.'/configuration.php';

echo '<root_tag>';
try
{
	session_start();
	
	//echo 'hhh'.$_SESSION['start_position'];
	//if (is_null($_SESSION['start_position']))	{
	    //$start_position = 0;
		//session_register("start_position");
	//	$_SESSION['start_position'] = 0;
	//	echo 'ddd0';
	//	}
	//session_register("packet_capacity");
	//session_register("doc_type_id");
	//session_register("last_uuid");
	//session_register("last_datetime");

	if (isset($_GET['partial_load'])) 	{
			if (is_null($_SESSION['start_position'])) {
				//$start_position = 0;
				$_SESSION['start_position'] = 0;
				//echo 'ddd1';
			}
			else	{
				//$start_position = $_SESSION['start_position'];
			}
			
			if (is_null($_SESSION['packet_capacity'])) {
				//$packet_capacity = 20;
				$_SESSION['packet_capacity'] = 20;
				//echo 'ddd2';
			}
			else	{
				//$packet_capacity = 20;
			}
		}
	else	{
		//$start_position = 0;
		$_SESSION['start_position'] = 0;
		//$packet_capacity = 20;
		$_SESSION['packet_capacity'] = 20;
		}
	
	if (isset($_GET['doc_type_id'])) 	{
			if (preg_match("/^[0-9]+$/",$_GET['doc_type_id'])) {
					$doc_type_id = $_GET['doc_type_id'];
					
				}
			else	{
					$doc_type_id = 1;
					echo '<php_warning msg="Переданный параметр типа документов не является целочисленным. Извлекается список документов по типу по умолчанию. Обратитесь к разработчику."/>';
				}
		}
	else	{
		$doc_type_id = 1;
		}

	$before_date = "";
	if (isset($_GET['before_date'])) {
			$before_date = $_GET['before_date'];
		}

	$after_date = "";
	if (isset($_GET['after_date'])) {
			$after_date = $_GET['after_date'];
		}

	$importance = "";
	if (isset($_GET['importance'])) {
			$importance = $_GET['importance'];
		}

	$over_budjet = "";
	if (isset($_GET['over_budjet'])) {
			$over_budjet = $_GET['over_budjet'];
		}
		
	$no_has_status = "";
	if (isset($_GET['no_has_status'])) {
			$no_has_status = $_GET['no_has_status'];
		}
	
	
	$last_uuid = "";
	$last_datetime = null;//date("Y.m.d h:i:s");
	
	
	
	/*function authenticate() {
		header('WWW-Authenticate: Basic realm="Test Authentication System"');
		header('HTTP/1.0 401 Unauthorized');
		echo '<php_error>Вы должны ввести корректный логин и пароль для получения доступа к ресурсу</php_error> \n';
		exit;
	}

	if (!isset($_SERVER['PHP_AUTH_USER']) ||
		($_POST['SeenBefore'] == 1 && $_POST['OldAuth'] == $_SERVER['PHP_AUTH_USER'])) {
		authenticate();
	} 
	else {
	
	}*/
	
	$client = new SoapClient($wss_base, 
                         array( 'trace' => TRUE, 
                                'login'=>$_SERVER['PHP_AUTH_USER'], 
                                'password'=>$_SERVER['PHP_AUTH_PW'] 
                              ) 
                        );

	$method_param = array('user_login'     =>    $_SERVER['PHP_AUTH_USER'],
		'operation_type'     =>    'w',
		'before_date'     =>    $before_date,
		'after_date'     =>    $after_date,
		'has_status'     =>    'w',
		'no_has_status'     =>    $no_has_status,
		'start_position'     =>    $_SESSION['start_position'],
		'packet_capacity'     =>    20,
		'doc_type_id'     =>    $doc_type_id,
		'last_datetime'     =>    $last_datetime,
		'last_uuid'     =>    $last_uuid,
		'importance'     =>    $importance,
		'over_budjet'     =>    $over_budjet); 
	
	$result = $client->__call("getPaymentDocs", array($method_param));
	//echo 
	$last_datetime = $result->return->last_datetime;
	//echo 
	$last_uuid = $result->return->last_uuid;
	//$start_position = $start_position + $packet_capacity;
	$_SESSION['start_position'] = $_SESSION['start_position'] + 20;
	
	echo $client->__getLastResponse().'</root_tag>';

}
catch(Exception $ex)
{
    echo '<php_error msg="Ошибка выполнения прокси-скрипта PHP запроса списка документов. Обратитесь к разработчику.'.$ex->getMessage().'"/></root_tag>';
} 

//unset($_SERVER['PHP_AUTH_USER']);
//unset($_SERVER['PHP_AUTH_PW']);

?>
