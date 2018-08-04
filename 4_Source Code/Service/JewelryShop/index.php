<?php
	include('connect/connect.php');
	
	$products = $mysqli->query('SELECT p.id_product, p.name as name ,p.id_type as idType, t.name as nameType, p.price, p.description, GROUP_CONCAT(i.link) AS image FROM product p LEFT JOIN image i ON p.id_product = i.id_product 
			inner join product_type t ON t.id_type = p.id_type 
			group by p.id_product');
	while ($row = $products->fetch_object()){
		$assignees = explode(',', $row->image);
		$row->image = $assignees;
	    $product[] = $row;
	}


	$product_types = $mysqli->query("Select * from product_type");
	while ($type = $product_types->fetch_object()){
	    $product_type[] = $type;
	}
	
	$array = array('type'=>$product_type,'product'=>$product);
	echo json_encode($array);


?>