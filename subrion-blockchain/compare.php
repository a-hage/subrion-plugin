<?php

	if ($iaView->getRequestType() == iaView::REQUEST_HTML) {

		$iaBlockchain = $iaCore->factoryModule('blockchain', IA_CURRENT_MODULE);
		$iaDb->setTable($iaBlockchain::getTable());
		$listing = [];
		$blockchainCompare = array();
		$compareName = array();
		$compareParam = isset($_GET['compare']) ? $_GET['compare'] : array();
		$hasCompare = is_array($compareParam)
			? !empty($compareParam)
			: '' !== trim((string)$compareParam);
		iaBreadcrumb::add(iaLanguage::get('blockchain'), IA_URL . 'blockchain/');
		switch ($pageAction) {
			case iaCore::ACTION_READ:
				if ($hasCompare) {
					break;
				}
				$id = (int)(isset($_GET['id']) ? $_GET['id'] : end($iaCore->requestPath));
				if (!$id) {
					return iaView::errorPage(iaView::ERROR_NOT_FOUND);
				}
				$listing = $iaBlockchain->getById($id);
				if (empty($listing)) {
					return iaView::errorPage(iaView::ERROR_NOT_FOUND);
				}
		}

		if ($hasCompare) {
			$blockchainCompare = $iaBlockchain->getBlockchainCompare($compareParam);
			$compareName = is_array($compareParam)
				? array_values(array_filter(array_map('trim', $compareParam), 'strlen'))
				: array_values(array_filter(array_map('trim', explode(',', $compareParam)), 'strlen'));
		}

		if (!$hasCompare) {
			return iaView::errorPage(iaView::ERROR_NOT_FOUND);
		}
		//print_r($compareName);
		$industry = array();
		for($i=0;$i<count($blockchainCompare);$i++){
			//echo $result[$i]['industryFocus'].'<br />';
			if(strstr($blockchainCompare[$i]['industryFocus'],',') ){
				$tmp = explode(',',$blockchainCompare[$i]['industryFocus']);
				for($n=0;$n<count($tmp);$n++){
					array_push($industry,$tmp[$n]);
				}
			}else{
				array_push($industry,$blockchainCompare[$i]['industryFocus']);
			}
		}
		//print_r($industry);
		sort($industry);
		$getIndustryFocus = array_values(array_unique($industry));
		//print_r($getIndustryFocus);

		$iaView->assign('compareName',$compareName);
		$iaView->assign('blockchainCompare',$blockchainCompare);
		$iaView->assign('getIndustryFocus',$getIndustryFocus);
		$iaView->display('compare');

	}

?>
