<?php
	#$iaBlockchain = $iaCore->factoryModule('blockchain', IA_CURRENT_MODULE);

	#$baseUrl = $iaCore->factory('page', iaCore::FRONT)->getUrlByName('blockchain');
	
	if (iaView::REQUEST_HTML == $iaView->getRequestType())
	{
		if(isset($_POST['category_filter'])){
			$categoryFilter = $_POST['category_filter']; 
			$blockchainFilter = $iaCore->factoryItem('blockchain')->getBlockchainFilter($categoryFilter);
			$iaView->assign('categoryFilter',$categoryFilter);
			$iaView->assign('blockchainFilter',$blockchainFilter);
		}else{
			$categoryFilter = "";
			$blockchainFilter = $iaCore->factoryItem('blockchain')->get();
			$iaView->assign('categoryFilter',$categoryFilter);
			$iaView->assign('blockchainFilter',$blockchainFilter);
		}
			
		$items = $iaCore->factoryItem('blockchain')->get();
		$usedCategory = $iaCore->factoryItem('blockchain')->getUsedCategory();
		$blocks = array();
		foreach($items as $item){
			extract($item);
			$item['category']= $iaCore->factoryItem('blockchain')->getBlockchainCategory($item['name']);
			array_push($blocks,$item);
		}
			
		$iaView->assign('usedCategory',$usedCategory);
		
		$iaView->assign('items',$items);
		$iaView->assign('blocks',$blocks);
		//print_r($blocks);
			
		$iaView->display('index');	

	}
?>


