<?php 

try
{

	$client = new SoapClient("http://admin:admin@localhost/FinansDemo/ws/PaymentDocs?wsdl", 
                         array( 'trace' => TRUE, 
                                'login'=>'admin', 
                                'password'=>'admin' 
                              ) 
                        );

	$result = $client->getPaymentDocs();
	echo $client->__getLastResponse();

}
catch(Exception $ex)
{
    echo '<php_error>'.$ex->getMessage().'</php_error>';
} 

?>
