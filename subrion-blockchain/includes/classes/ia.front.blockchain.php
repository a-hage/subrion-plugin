<?php
class iaBlockchain extends abstractModuleFront
{
	protected static $_table = 'blockchain';
	protected $_moduleName = 'blockchain';
	protected $_itemName = 'blockchain'; 
		
	/**
	 * get all the blockchain saved in the database
	 * @retrun an array
	 */
	 
	public function get()
	{
		$this->iaCore->factoryItem('blockchaincategory');
		$this->iaCore->factoryItem('blockchain_category');
		
		$sql= <<<SQL
SELECT DISTINCT b.`name` , b.`website`, b.`description` 
FROM `:table_blockchain` b 
INNER JOIN `:table_blockchain_category` b_c ON (b_c.`blockchainId` = b.`id`) 
INNER JOIN `:table_blockchaincategory` bc ON (b_c.`categoryId` = bc.`id`) 
WHERE b.`version`= 1
SQL;
			
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchaincategory' => iaBlockchainCategory::getTable(true),
										'table_blockchain_category' => iaBlockchain_Category::getTable(true)]);
			
		$result = $this->iaDb->getAll($sql);
		return $result;
	}
	
	
	/**
	 * get the Used Category for the inserted blockchains
	 * @retrun a array
	 */
	public function getUsedCategory()
	{
		$this->iaCore->factoryItem('blockchaincategory');
		$this->iaCore->factoryItem('blockchain_category');
		
		$sql= <<<SQL
SELECT DISTINCT b_c.`categoryId`, bc.`name` 
FROM `:table_blockchain_category` b_c 
INNER JOIN `:table_blockchaincategory` bc ON (b_c.`categoryId` = bc.`id`)
SQL;
			
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchaincategory' => iaBlockchainCategory::getTable(true),
										'table_blockchain_category' => iaBlockchain_Category::getTable(true)]);	
		$category = $this->iaDb->getAll($sql);
		//print_r($result);
		return $category;
	}
	
	
	/**
	 * get the Filter of Category
	 * @param categoryFilter category POST
	 * @return an array
	 */
	public function getBlockchainFilter($categoryFilter)
	{
		$this->iaCore->factoryItem('blockchaincategory');
		$this->iaCore->factoryItem('blockchain_category');
		//print_r($categoryFilter);
		if(isset($categoryFilter)){
			$category_filter = implode("','",array_filter($categoryFilter));
		}
		//echo "Test";
		//print_r($category_filter);
		
		$sql= <<<SQL
		SELECT DISTINCT b.`name` , b.`website`, b.`description` 
		FROM `:table_blockchain` b 
		INNER JOIN `:table_blockchain_category` b_c ON (b_c.`blockchainId` = b.`id`) 
		INNER JOIN `:table_blockchaincategory` bc ON (bc.`id` = b_c.`categoryId`) 
		WHERE bc.`name` IN('$category_filter')
		  AND b.`version`= 1
		GROUP BY b_c.`blockchainId`
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchaincategory' => iaBlockchainCategory::getTable(true),
										'table_blockchain_category' => iaBlockchain_Category::getTable(true)]);
			
		return $this->iaDb->getAll($sql);
	}
	
	
	/**
	 * get the Categories for specific blockchain
	 * @param the blockchain name
	 * @return an array
	 */ 
	 
	public function getBlockchainCategory($name)
	{
		$this->iaCore->factoryItem('blockchaincategory');
		$this->iaCore->factoryItem('blockchain_category');
		
		$sql= <<<SQL
		SELECT bc.`name`
		FROM `:table_blockchaincategory` bc  
		INNER JOIN `:table_blockchain_category` b_c ON (bc.`id` = b_c.`categoryId`) 
		INNER JOIN `:table_blockchain` b ON (b_c.`blockchainId` = b.`id`)
		WHERE b.`name` = '$name';
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchaincategory' => iaBlockchainCategory::getTable(true),
										'table_blockchain_category' => iaBlockchain_Category::getTable(true)
										]);
		$results = $this->iaDb->getAll($sql);
		
		return $results;
	}
	
	
	/**
	 * get the Protocol for specific blockchain
	 * @param the blockchain name
	 * @retrun an array
	 */
	 
	public function getBlockchainProtocol($name)
	{
		
		$this->iaCore->factoryItem('blockchainprotocol');
		
		$sql= <<<SQL
		SELECT bp.`name`,bp.`abbreviation`
		FROM `:table_blockchainprotocol` bp  
		INNER JOIN `:table_blockchain` b ON (bp.`id` = b.`protocolId`)
		WHERE b.`name` = '$name';
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchainprotocol' => iaBlockchainProtocol::getTable(true)
										]);
		$results = $this->iaDb->getAll($sql);
		return $results;	
	}
	

	
	/**
	 * get the Hash for specific blockchain
	 * @param the blockchain name
	 * @retrun an array
	 */

	public function getBlockchainHash($name)
	{
		$this->iaCore->factoryItem('blockchainhash');
		$this->iaCore->factoryItem('blockchain_hash');
		
		$sql= <<<SQL
		SELECT bh.`name`
		FROM `:table_blockchainhash` bh 
		INNER JOIN `:table_blockchain_hash` b_h ON (bh.`id` = b_h.`hashId`)
		INNER JOIN `:table_blockchain` b ON (b.`id` = b_h.`blockchainId`)
		WHERE b.`name` = '$name';
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchainhash' => iaBlockchainHash::getTable(true),
										'table_blockchain_hash' => iaBlockchain_Hash::getTable(true)
										]);
		$results = $this->iaDb->getAll($sql);
		return $results;	
	}
	
	/**
	 *  OR it is an other way to get the Hash-Function of specific blockchain
	 */
	public function getBlockchainHash2($name)
	{
		$sql = "SELECT sbr421_blockchainhash.`name` FROM sbr421_blockchainhash 
				INNER JOIN sbr421_blockchain_hash ON (sbr421_blockchain_hash.`hashId` = sbr421_blockchainhash.`id`) 
				INNER JOIN sbr421_blockchain ON (sbr421_blockchain_hash.`blockchainId` =sbr421_blockchain.`id`) 
				WHERE sbr421_blockchain.`name` = '$name' ";
			
		$result = $this->iaDb->getAll($sql);
		return $result;
	}

	/**
	 * get the Signatur for specific blockchain
	 * @param the blockchain name
	 * @retrun an array
	 */

	public function getBlockchainSignatur($name)
	{
		$this->iaCore->factoryItem('blockchainsignatur');
		
		$sql= <<<SQL
		SELECT bs.`name`
		FROM `:table_blockchainsignatur` bs 
		INNER JOIN `:table_blockchain` b ON (bs.`id` = b.`signaturId`)
		WHERE b.`name` = '$name';
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchainsignatur' => iaBlockchainSignatur::getTable(true)
										]);
		$results = $this->iaDb->getAll($sql);
		return $results;	
	}
	

	/**
	 *  OR it is an other way to get the Signatur of specific blockchain
	 */
	public function getBlockchainSignatur2($name)
	{
		$sql = "SELECT sbr421_blockchainsignatur.`name` FROM sbr421_blockchainsignatur 
				INNER JOIN sbr421_blockchain ON (sbr421_blockchainsignatur.`id` = sbr421_blockchain.`signaturId`)  
				WHERE sbr421_blockchain.`name` = '$name' ";
			
		$result = $this->iaDb->getAll($sql);
		return $result;
	}

	
	/**
	 * get the Social Media for specific blockchain
	 * @param the blockchain name
	 * @retrun an array
	 */
	 
	public function getBlockchainSocialmedia($name)
	{
		$this->iaCore->factoryItem('blockchainsocialmedia');
		$this->iaCore->factoryItem('blockchain_socialmedia');
		
		$sql= <<<SQL
		SELECT bsm.`name`
		FROM `:table_blockchainsocialmedia` bsm
		INNER JOIN `:table_blockchain_socialmedia` b_sm ON (bsm.`id` = b_sm.`fkSocialmediaId`)
		INNER JOIN `:table_blockchain` b ON (b.`id` = b_sm.`fkBlockchainId`)
		WHERE b.`name` = '$name';
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true),
										'table_blockchainsocialmedia' => iaBlockchainSocialmedia::getTable(true),
										'table_blockchain_socialmedia' => iaBlockchain_Socialmedia::getTable(true)
										]);
		$results = $this->iaDb->getAll($sql);
		return $results;	
	}
	
	/**
	 * get the Blockchain
	 * @param the blockchain name
	 * @retrun an array
	 */
	 
	public function getBlockchain($name)
	{
		$sql= <<<SQL
		SELECT b.id,b.version,b.name,b.exchangeSymbol,b.description,
		b.website,b.color,b.runtime,b.isAPISupport,b.blocktime,
		b.isBlockRewards,b.isAtomicSwap,b.isSideChildChain,b.isPrivacyFeature,
		b.mainnetLaunched,b.latestRelease,b.isTokenAvailable,b.transactionCost,
		b.transactionPerformance,b.scalabilityOfNetwork,b.securityOfTransaction,
		b.securityOfBlockchain,b.permission,b.isModularity,b.isEcosystem,
		b.energyConsumption,b.isDecentralizedExchange,b.isDistributedLedgerTechnology,
		b.isIntegrationInLegacySystem,b.typeOfCryptoTechnology,b.industryFocus,b.wallet,
		b.developerTeamSize,b.isSupportTeam,b.isMaintenanceRequired,b.maturity,
		b.proprietary,b.licensing,b.pricing,b.isProductionReady,b.storageCapacity,
		b.partnershipAlliance,b.links
		FROM `:table_blockchain` b
		WHERE b.`name` = '$name';
		SQL;
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
										'table_blockchain' => self::getTable(true)
										]);
		$results = $this->iaDb->getAll($sql);
		$blockchainInfo = array();
		foreach($results as $result){
			extract($result);
			$result['protocol'] = $this->getBlockchainProtocol($name);
			$result['hash'] = $this->getBlockchainHash($name);
			$result['signatur'] = $this->getBlockchainSignatur($name);
			$result['socialmedia'] = $this->getBlockchainSocialmedia($name);
			$result['category'] = $this->getBlockchainCategory($name);
			array_push($blockchainInfo,$result);
		}
		
		return $blockchainInfo;	
	}
	
	
	/**
	 * get the Blockchain Compare
	 * @compareGET the blockchain name
	 * @retrun an array
	 */	
	public function getBlockchainCompare($compareGET)
	{
		//echo $compareGET
		if(!empty($compareGET)){
			$compare = explode(',',$compareGET);
			if(!empty($compare)){
				$compare_filter = implode("','",$compare);
				//print_r($compare_filter);
			}		
		}
		$sql= <<<SQL
		SELECT b.id,b.version,b.name,b.exchangeSymbol,b.description,
		b.website,b.color,b.runtime,b.isAPISupport,b.blocktime,
		b.isBlockRewards,b.isAtomicSwap,b.isSideChildChain,b.isPrivacyFeature,
		b.mainnetLaunched,b.latestRelease,b.isTokenAvailable,b.transactionCost,
		b.transactionPerformance,b.scalabilityOfNetwork,b.securityOfTransaction,
		b.securityOfBlockchain,b.permission,b.isModularity,b.isEcosystem,
		b.energyConsumption,b.isDecentralizedExchange,b.isDistributedLedgerTechnology,
		b.isIntegrationInLegacySystem,b.typeOfCryptoTechnology,b.industryFocus,b.wallet,
		b.developerTeamSize,b.isSupportTeam,b.isMaintenanceRequired,b.maturity,
		b.proprietary,b.licensing,b.pricing,b.isProductionReady,b.storageCapacity,
		b.partnershipAlliance,b.links
		FROM `:table_blockchain` b
		WHERE b.`name` IN ('$compare_filter'); 
		SQL;
					
		$sql = $this->iaDb::printf($sql,['prefix' => $this->iaDb->prefix,
									'table_blockchain' => self::getTable(true)
									]);
		$results = $this->iaDb->getAll($sql);
		$blockchainCompare = array();
		foreach($results as $result){
			extract($result);
			$result['protocol'] = $this->getBlockchainProtocol($result['name']);
			$result['hash'] = $this->getBlockchainHash($result['name']);
			$result['signatur'] = $this->getBlockchainSignatur($result['name']);
			$result['socialmedia'] = $this->getBlockchainSocialmedia($result['name']);
			$result['category'] = $this->getBlockchainCategory($result['name']);
			array_push($blockchainCompare,$result);
		}
		return $blockchainCompare;
	}
	
	

	public function url($action, array $listingData, $relativeToRoot = false)
    {
        $patterns = [
            'default' => ':blockchain/',
            'detail' => 'blockchain/detail/:title-:id.html'
        ];
        //        $baseUrl = ('my' == $action) ? IA_URL : $this->getInfo('url');
        $baseUrl = IA_URL;
        //
        if ($action != 'detail') {
            $baseUrl = $this->iaCore->factory('page')->getUrlByName('blockchain_' . $action);
        }
        $uri = iaDb::printf(
            isset($patterns[$action]) ? $patterns[$action] : $patterns['default'],
            [
                'action' => $action,
                'title' => isset($listingData['title_' . $this->iaCore->language['iso']]) ? iaSanitize::alias($listingData['title_' . $this->iaCore->language['iso']]) : '',
                'id' => isset($listingData['id']) ? $listingData['id'] : ''
            ]
        );
        return $baseUrl . $uri;
    }
    
   /**
	 * get the Url
	 * @param  $data is an array
	 * @retrun url vie thew method url()
	 */
    public function getUrl(array $data)
    {
        return $this->url('detail', $data);
    }
	
	public function getById($id, $decorate = true)
    {
        $sql = <<<SQL
		SELECT * FROM :table_blockchain
		WHERE `id` = :id
		SQL;
        $sql = iaDb::printf($sql, [
            'table_blockchain' => self::getTable(true),
            'id' => $id
        ]);
        $result = $this->iaDb->getRow($sql);
        $decorate && $this->_processValues($result, true);
        return $result;
    }
  
}

?>
