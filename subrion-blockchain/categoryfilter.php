<?php
	if (iaView::REQUEST_HTML == $iaView->getRequestType())
	{ 
		$sql=<<<SQL
SELECT b_c.`categoryId`,b.`website`,bc.`name` FROM `:table_blockchain_category` b_c INNER JOIN `:table_blockchaincategory` bc ON (b_c.`categoryId` = bc.`id`)  
SQL;

 $sql = $iaDb::printf($sql, [
					'prefix' => $iaDb->prefix,
					'table_blockchaincategory' => iaBlockchainCategory::getTable(true),
					'table_blockchain_category' => iaBlockchain_Category::getTable(true)
				]);
				
		$usedCategory = $iaDb->getAll($sql);
		//print_r($usedCategory);
	}
	//echo "UsedCategory";
	$iaView->assign('usedCategory',  $usedCategory);
	$iaView->display('categoryfilter');	
?>
