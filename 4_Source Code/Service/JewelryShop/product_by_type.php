<?php

	include('connect/connect.php');
	$id_type = $_GET['id_type'];

	$limit = 3;
	$page = isset($_GET['page'])?$_GET['page']:1;
	settype($page, "int");
	$offset = ($page - 1) * $limit;
	
	$products = $mysqli->query("SELECT p.*, t.name as nameType, GROUP_CONCAT(i.link) AS image FROM product p inner join product_type t ON t.id_type = p.id_type INNER JOIN image i ON i.id_product = p.id_product WHERE t.id_type = $id_type group by p.id_product LIMIT $offset,$limit ");
	
	while ($row = $products->fetch_object()){
	    $assignees = explode(',', $row->image);
		$row->image = $assignees;
	    $product[] = $row;
	}

	echo json_encode($product);


?>