<?php 

echo '<root_tag>';
try
{
	session_start();
	
	$client = new SoapClient("http://localhost/FinansDemo/ws/GetCurrentUserInfo?wsdl", 
                         array( 'trace' => TRUE, 
                                'login'=>$_SERVER['PHP_AUTH_USER'], 
                                'password'=>$_SERVER['PHP_AUTH_PW'] 
                              ) 
                        );

	$method_param = array('user_login'     =>    $_SERVER['PHP_AUTH_USER']); 
	
	$result = $client->__call("getUserTasks", array($method_param));
	
	echo $client->__getLastResponse().'</root_tag>';

}
catch(Exception $ex)
{
    echo '<php_error msg="Ошибка выполнения прокси-скрипта PHP запроса текущих показателей. Обратитесь к разработчику.'.$ex->getMessage().'"/></root_tag>';
} 

//unset($_SERVER['PHP_AUTH_USER']);
//unset($_SERVER['PHP_AUTH_PW']);

?>
