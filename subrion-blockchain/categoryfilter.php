<?php
	if (iaView::REQUEST_HTML == $iaView->getRequestType())
	{
		$sql=<<<SQL
SELECT b_c.`categoryId`, b.`website`, bc.`name`
FROM `:table_blockchain_category` b_c
INNER JOIN `:table_blockchaincategory` bc ON (b_c.`categoryId` = bc.`id`)
INNER JOIN `:table_blockchain` b ON (b_c.`blockchainId` = b.`id`)
SQL;

		$sql = iaDb::printf($sql, [
			'prefix' => $iaDb->prefix,
			'table_blockchain' => $iaDb->prefix . 'blockchain',
			'table_blockchaincategory' => $iaDb->prefix . 'blockchaincategory',
			'table_blockchain_category' => $iaDb->prefix . 'blockchain_category'
		]);
		$usedCategory = $iaDb->getAll($sql);
		//print_r($usedCategory);
	}
	$iaView->assign('usedCategory',  $usedCategory);
	$iaView->display('categoryfilter');
?>
