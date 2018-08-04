<?php
//đăng kí
include('connect/connect.php');
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
$name = $obj['name'];
$email = $obj['email'];
$address = $obj['address'];
$phone = $obj['phone'];
$password = md5($obj['password']);
if($name !='' && $email != '' && $address !='' && $phone != '' && $password!=''){
	
	$sql = "INSERT INTO user(name, email, address, phone, password) VALUES('$name', '$email','$address', '$phone', '$password')";
	$result = $mysqli->query($sql);
	if($result){
		echo 'THANH_CONG';
	}
	else{
		echo 'KHONG_THANH_CONG';
	}
}
else{
	echo 'KHONG_THANH_CONG';
}

?>