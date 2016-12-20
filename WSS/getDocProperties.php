<?php 

echo '<root_tag>';
$doc_id = "";
try
{
	session_start();
	
	
	if (isset($_GET['doc_id'])) 	{
			if (!is_null($_GET['doc_id'])) {
					$doc_id = $_GET['doc_id'];
				}
			else	{
				echo '<m:success_value comment="" doc_id="'.$doc_id.'" logical_value="Не выполнено" result_text="Переданный параметр идентификатора объекта содержит пустое значение. Обратитесь к разработчику."/>';
				echo '<php_error msg="Переданный параметр идентификатора объекта содержит пустое значение. Обратитесь к разработчику."/>';
				}
		}
	else	{
		}

	$doc_type_id = 1;
	if (isset($_GET['doc_type_id'])) 	{
			if (preg_match("/^[0-9]+$/",$_GET['doc_type_id'])) {
					$doc_type_id = $_GET['doc_type_id'];
				}
			else	{
				echo '<m:success_value comment="" doc_id="'.$doc_id.'" logical_value="Не выполнено" result_text="Переданный параметр типа документов не является целочисленным. Обратитесь к разработчику."/>';
				echo '<php_error msg="Переданный параметр типа документов не является целочисленным. Обратитесь к разработчику."/>';
				}
		}
	else	{
		}
		
	$data_type = "empty";
	if (isset($_GET['data_type'])) 	{
			if (!is_null($_GET['data_type'])) {
					$data_type = $_GET['data_type'];
				}
			else	{
				echo '<m:success_value comment="" doc_id="'.$doc_id.'" logical_value="Не выполнено" result_text="Переданный параметр типа извлекаемых данных содержит пустое значение. Обратитесь к разработчику."/>';
				echo '<php_error msg="Переданный параметр типа извлекаемых данных содержит пустое значение. Обратитесь к разработчику."/>';
				}
		}
	else	{
		}
	
	//$last_uuid = "";
	//$last_datetime = null;//date("Y.m.d h:i:s");
	
	$client = new SoapClient("http://localhost/FinansDemo/ws/PaymentDocs?wsdl", 
                         array( 'trace' => TRUE, 
                                'login'=>$_SERVER['PHP_AUTH_USER'], 
                                'password'=>$_SERVER['PHP_AUTH_PW'] 
                              ) 
                        );

	$method_param = array('doc_type_id'     =>    $doc_type_id,
		'doc_id'     =>    $doc_id,
		'user_login'     =>    $_SERVER['PHP_AUTH_USER'],
		'data_type'     =>    $data_type
		); 
	
	$result = $client->__call("getDocProperties", array($method_param));
	//echo 
	//$last_datetime = $result->return->last_datetime;
	//echo 
	//$last_uuid = $result->return->last_uuid;
	//$start_position = $start_position + $packet_capacity;
	//$_SESSION['start_position'] = $_SESSION['start_position'] + 20;
	
	echo $client->__getLastResponse().'</root_tag>';

}
catch(Exception $ex)
{
	echo '<m:success_value comment="" doc_id="'.$doc_id.'" logical_value="Не выполнено" result_text="Веб-сервер возвратил ошибку: '.$ex->getMessage().'"/>';
    	echo '<php_error msg="Ошибка выполнения прокси-скрипта PHP запроса на запрос свойств объекта. Обратитесь к разработчику.'.$ex->getMessage().'"/></root_tag>';
} 

//unset($_SERVER['PHP_AUTH_USER']);
//unset($_SERVER['PHP_AUTH_PW']);

?>
