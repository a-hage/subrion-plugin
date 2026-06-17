<?php

$iaBlockchain = $iaCore->factoryModule('blockchain', IA_CURRENT_MODULE);

// Seiten-URL holen (optional)
$baseUrl = $iaCore->factory('page', iaCore::FRONT)->getUrlByName('blockchain');
$comparePageUrl = $iaCore->factory('page', iaCore::FRONT)->getUrlByName('blockchain_compare');
$detailPageUrl = $iaCore->factory('page', iaCore::FRONT)->getUrlByName('blockchain_detail');

// Nur bei HTML Requests ausführen
if (iaView::REQUEST_HTML == $iaView->getRequestType())
{
    // Kategorie-Filter vorhanden
    if (isset($_POST['category_filter']) && !empty($_POST['category_filter'])) {

        $categoryFilter = $_POST['category_filter'];

        // korrekt: kein factoryItem mehr
        $blockchainFilter = $iaBlockchain->getBlockchainFilter($categoryFilter);

        $iaView->assign('categoryFilter', $categoryFilter);
        $iaView->assign('blockchainFilter', $blockchainFilter);

    } else {

        $categoryFilter = [];

        // alle Daten holen
        $blockchainFilter = $iaBlockchain->get();

        $iaView->assign('categoryFilter', $categoryFilter);
        $iaView->assign('blockchainFilter', $blockchainFilter);
    }

    // Basisdaten laden
    $items = $iaBlockchain->get();
    $usedCategory = $iaBlockchain->getUsedCategory();

    $blocks = [];

    foreach ($items as $item) {
        // Kategorien sauber setzen
        $item['category'] = $iaBlockchain->getBlockchainCategory($item['name']);
        $blocks[] = $item;
    }

    // an Template übergeben
    $iaView->assign('usedCategory', $usedCategory);
    $iaView->assign('items', $items);
    $iaView->assign('blocks', $blocks);
    $iaView->assign('comparePageUrl', $comparePageUrl);
    $iaView->assign('detailPageUrl', $detailPageUrl);

    // Template rendern
    $iaView->display('index');
}
