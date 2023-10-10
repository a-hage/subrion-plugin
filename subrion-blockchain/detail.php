<?php

	if ($iaView->getRequestType() == iaView::REQUEST_HTML) {
  
		$iaBlockchain = $iaCore->factoryModule('blockchain', IA_CURRENT_MODULE);
		$iaDb->setTable($iaBlockchain::getTable());
		$listing = [];
		iaBreadcrumb::add(iaLanguage::get('blockchain'), IA_URL . 'blockchain/');
		switch ($pageAction) {
			case iaCore::ACTION_READ:
				$id = (int)(isset($_GET['id']) ? $_GET['id'] : end($iaCore->requestPath));
				if (!$id) {
					return iaView::errorPage(iaView::ERROR_NOT_FOUND);
				}
				$listing = $iaBlockchain->getById($id);
				if (empty($listing)) {
					return iaView::errorPage(iaView::ERROR_NOT_FOUND);
				}
		}
		
		if (isset($_GET['detail'])){
			$name = $_GET['detail'];
			$blockchainInfo = $iaCore->factoryItem('blockchain')->getBlockchain($name);
		}
		
		if (empty($_GET['detail']) || empty($blockchainInfo)) {
			return iaView::errorPage(iaView::ERROR_NOT_FOUND);
		}

		$iaView->assign('blockchainInfo',$blockchainInfo);
		$iaView->display('detail');
	
	}
	
	
?>
