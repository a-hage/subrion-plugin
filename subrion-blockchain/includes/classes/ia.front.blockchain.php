<?php
class iaBlockchain extends abstractModuleFront
{
	protected static $_table = 'blockchain';
	protected $_moduleName = 'blockchain';
	protected $_itemName = 'blockchain';

	protected function escapeValue($value)
	{
		return strtr((string)$value, array(
			"\\" => "\\\\",
			"\0" => "\\0",
			"\n" => "\\n",
			"\r" => "\\r",
			"\032" => "\\Z",
			"'" => "\\'",
			'"' => '\\"'
		));
	}

	protected function buildInCondition(array $values)
	{
		$values = array_filter(array_map('trim', $values), 'strlen');

		if (empty($values)) {
			return '';
		}

		$escapedValues = array_map(array($this, 'escapeValue'), $values);

		return "'" . implode("','", $escapedValues) . "'";
	}

	protected function normalizeCompareValues($compare)
	{
		if (is_array($compare)) {
			return array_values(array_filter(array_map('trim', $compare), 'strlen'));
		}

		if (!is_string($compare) || '' === trim($compare)) {
			return array();
		}

		return array_values(array_filter(array_map('trim', explode(',', $compare)), 'strlen'));
	}

	protected function getPrefixedTable($table)
	{
		return $this->iaDb->prefix . $table;
	}

	/**
	 * get all the blockchain saved in the database
	 * @return array
	 */
	public function get()
	{
		$sql = "SELECT DISTINCT b.`name`, b.`website`, b.`description`
FROM `:table_blockchain` b
INNER JOIN `:table_blockchain_category` b_c ON (b_c.`blockchainId` = b.`id`)
INNER JOIN `:table_blockchaincategory` bc ON (b_c.`categoryId` = bc.`id`)";

		$sql = iaDb::printf($sql, array(
			'prefix'                   => $this->iaDb->prefix,
			'table_blockchain'         => self::getTable(true),
			'table_blockchaincategory' => $this->getPrefixedTable('blockchaincategory'),
			'table_blockchain_category'=> $this->getPrefixedTable('blockchain_category')
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Used Category for the inserted blockchains
	 * @return array
	 */
	public function getUsedCategory()
	{
		$sql = "SELECT DISTINCT b_c.`categoryId`, bc.`name`
FROM `:table_blockchain_category` b_c
INNER JOIN `:table_blockchaincategory` bc ON (b_c.`categoryId` = bc.`id`)";

		$sql = iaDb::printf($sql, array(
			'prefix'                   => $this->iaDb->prefix,
			'table_blockchaincategory' => $this->getPrefixedTable('blockchaincategory'),
			'table_blockchain_category'=> $this->getPrefixedTable('blockchain_category')
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Filter of Category
	 * @param array $categoryFilter category POST
	 * @return array
	 */
	public function getBlockchainFilter($categoryFilter)
	{
		$categoryFilter = is_array($categoryFilter) ? $categoryFilter : array();
		$categoryFilterCondition = $this->buildInCondition($categoryFilter);

		if (empty($categoryFilterCondition)) {
			return array();
		}

		$sql = "SELECT DISTINCT b.`name`, b.`website`, b.`description`
FROM `:table_blockchain` b
INNER JOIN `:table_blockchain_category` b_c ON (b_c.`blockchainId` = b.`id`)
INNER JOIN `:table_blockchaincategory` bc ON (bc.`id` = b_c.`categoryId`)
WHERE bc.`name` IN (%s)
  AND b.`version` = 1
GROUP BY b_c.`blockchainId`";

		$sql = sprintf($sql, $categoryFilterCondition);

		$sql = iaDb::printf($sql, array(
			'prefix'                   => $this->iaDb->prefix,
			'table_blockchain'         => self::getTable(true),
			'table_blockchaincategory' => $this->getPrefixedTable('blockchaincategory'),
			'table_blockchain_category'=> $this->getPrefixedTable('blockchain_category')
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Categories for a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainCategory($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bc.`name`
FROM `:table_blockchaincategory` bc
INNER JOIN `:table_blockchain_category` b_c ON (bc.`id` = b_c.`categoryId`)
INNER JOIN `:table_blockchain` b ON (b_c.`blockchainId` = b.`id`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'                   => $this->iaDb->prefix,
			'table_blockchain'         => self::getTable(true),
			'table_blockchaincategory' => $this->getPrefixedTable('blockchaincategory'),
			'table_blockchain_category'=> $this->getPrefixedTable('blockchain_category'),
			'name'                     => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Protocol for a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainProtocol($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bp.`name`, bp.`abbreviation`
FROM `:table_blockchainprotocol` bp
INNER JOIN `:table_blockchain` b ON (bp.`id` = b.`protocolId`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'                  => $this->iaDb->prefix,
			'table_blockchain'        => self::getTable(true),
			'table_blockchainprotocol'=> $this->getPrefixedTable('blockchainprotocol'),
			'name'                    => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Hash for a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainHash($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bh.`name`
FROM `:table_blockchainhash` bh
INNER JOIN `:table_blockchain_hash` b_h ON (bh.`id` = b_h.`hashId`)
INNER JOIN `:table_blockchain` b ON (b.`id` = b_h.`blockchainId`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'               => $this->iaDb->prefix,
			'table_blockchain'     => self::getTable(true),
			'table_blockchainhash' => $this->getPrefixedTable('blockchainhash'),
			'table_blockchain_hash'=> $this->getPrefixedTable('blockchain_hash'),
			'name'                 => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * Alternative method to get the Hash-Function of a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainHash2($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bh.`name`
FROM `:table_blockchainhash` bh
INNER JOIN `:table_blockchain_hash` b_h ON (b_h.`hashId` = bh.`id`)
INNER JOIN `:table_blockchain` b ON (b_h.`blockchainId` = b.`id`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'               => $this->iaDb->prefix,
			'table_blockchain'     => self::getTable(true),
			'table_blockchainhash' => $this->getPrefixedTable('blockchainhash'),
			'table_blockchain_hash'=> $this->getPrefixedTable('blockchain_hash'),
			'name'                 => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Signatur for a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainSignatur($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bs.`name`
FROM `:table_blockchainsignatur` bs
INNER JOIN `:table_blockchain` b ON (bs.`id` = b.`signaturId`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'                 => $this->iaDb->prefix,
			'table_blockchain'       => self::getTable(true),
			'table_blockchainsignatur'=> $this->getPrefixedTable('blockchainsignatur'),
			'name'                   => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * Alternative method to get the Signatur of a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainSignatur2($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bs.`name`
FROM `:table_blockchainsignatur` bs
INNER JOIN `:table_blockchain` b ON (bs.`id` = b.`signaturId`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'                 => $this->iaDb->prefix,
			'table_blockchain'       => self::getTable(true),
			'table_blockchainsignatur'=> $this->getPrefixedTable('blockchainsignatur'),
			'name'                   => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get the Social Media for a specific blockchain
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchainSocialmedia($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT bsm.`name`
FROM `:table_blockchainsocialmedia` bsm
INNER JOIN `:table_blockchain_socialmedia` b_sm ON (bsm.`id` = b_sm.`fkSocialmediaId`)
INNER JOIN `:table_blockchain` b ON (b.`id` = b_sm.`fkBlockchainId`)
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'                      => $this->iaDb->prefix,
			'table_blockchain'            => self::getTable(true),
			'table_blockchainsocialmedia' => $this->getPrefixedTable('blockchainsocialmedia'),
			'table_blockchain_socialmedia'=> $this->getPrefixedTable('blockchain_socialmedia'),
			'name'                        => $name
		));

		return $this->iaDb->getAll($sql);
	}

	/**
	 * get a specific Blockchain with all related data
	 * @param string $name the blockchain name
	 * @return array
	 */
	public function getBlockchain($name)
	{
		$name = $this->escapeValue($name);

		$sql = "SELECT b.id, b.version, b.name, b.exchangeSymbol, b.description,
b.website, b.color, b.runtime, b.isAPISupport, b.blocktime,
b.isBlockRewards, b.isAtomicSwap, b.isSideChildChain, b.isPrivacyFeature,
b.mainnetLaunched, b.latestRelease, b.isTokenAvailable, b.transactionCost,
b.transactionPerformance, b.scalabilityOfNetwork, b.securityOfTransaction,
b.securityOfBlockchain, b.permission, b.isModularity, b.isEcosystem,
b.energyConsumption, b.isDecentralizedExchange, b.isDistributedLedgerTechnology,
b.isIntegrationInLegacySystem, b.typeOfCryptoTechnology, b.industryFocus, b.wallet,
b.developerTeamSize, b.isSupportTeam, b.isMaintenanceRequired, b.maturity,
b.proprietary, b.licensing, b.pricing, b.isProductionReady, b.storageCapacity,
b.partnershipAlliance, b.links
FROM `:table_blockchain` b
WHERE b.`name` = ':name'";

		$sql = iaDb::printf($sql, array(
			'prefix'           => $this->iaDb->prefix,
			'table_blockchain' => self::getTable(true),
			'name'             => $name
		));

		$results = $this->iaDb->getAll($sql);
		$blockchainInfo = array();

		foreach ($results as $result) {
			$result['protocol']    = $this->getBlockchainProtocol($result['name']);
			$result['hash']        = $this->getBlockchainHash($result['name']);
			$result['signatur']    = $this->getBlockchainSignatur($result['name']);
			$result['socialmedia'] = $this->getBlockchainSocialmedia($result['name']);
			$result['category']    = $this->getBlockchainCategory($result['name']);
			$blockchainInfo[]      = $result;
		}

		return $blockchainInfo;
	}

	/**
	 * get Blockchain comparison data for multiple blockchains
	 * @param string $compareGET comma-separated blockchain names
	 * @return array
	 */
	public function getBlockchainCompare($compareGET)
	{
		$compare = $this->normalizeCompareValues($compareGET);
		$compareFilterCondition = $this->buildInCondition($compare);

		if (empty($compareFilterCondition)) {
			return array();
		}

		$sql = "SELECT b.id, b.version, b.name, b.exchangeSymbol, b.description,
b.website, b.color, b.runtime, b.isAPISupport, b.blocktime,
b.isBlockRewards, b.isAtomicSwap, b.isSideChildChain, b.isPrivacyFeature,
b.mainnetLaunched, b.latestRelease, b.isTokenAvailable, b.transactionCost,
b.transactionPerformance, b.scalabilityOfNetwork, b.securityOfTransaction,
b.securityOfBlockchain, b.permission, b.isModularity, b.isEcosystem,
b.energyConsumption, b.isDecentralizedExchange, b.isDistributedLedgerTechnology,
b.isIntegrationInLegacySystem, b.typeOfCryptoTechnology, b.industryFocus, b.wallet,
b.developerTeamSize, b.isSupportTeam, b.isMaintenanceRequired, b.maturity,
b.proprietary, b.licensing, b.pricing, b.isProductionReady, b.storageCapacity,
b.partnershipAlliance, b.links
FROM `:table_blockchain` b
WHERE b.`name` IN (%s)";

		$sql = sprintf($sql, $compareFilterCondition);

		$sql = iaDb::printf($sql, array(
			'prefix'           => $this->iaDb->prefix,
			'table_blockchain' => self::getTable(true)
		));

		$results = $this->iaDb->getAll($sql);
		$blockchainCompare = array();

		foreach ($results as $result) {
			$result['protocol']    = $this->getBlockchainProtocol($result['name']);
			$result['hash']        = $this->getBlockchainHash($result['name']);
			$result['signatur']    = $this->getBlockchainSignatur($result['name']);
			$result['socialmedia'] = $this->getBlockchainSocialmedia($result['name']);
			$result['category']    = $this->getBlockchainCategory($result['name']);
			$blockchainCompare[]   = $result;
		}

		return $blockchainCompare;
	}

	public function url($action, array $listingData, $relativeToRoot = false)
	{
		$patterns = array(
			'default' => ':blockchain/',
			'detail'  => 'blockchain/detail/:title-:id.html'
		);

		$baseUrl = IA_URL;

		if ($action != 'detail') {
			$baseUrl = $this->iaCore->factory('page')->getUrlByName('blockchain_' . $action);
		}

		$uri = iaDb::printf(
			isset($patterns[$action]) ? $patterns[$action] : $patterns['default'],
			array(
				'action' => $action,
				'title'  => isset($listingData['title_' . $this->iaCore->language['iso']])
					? iaSanitize::alias($listingData['title_' . $this->iaCore->language['iso']])
					: '',
				'id'     => isset($listingData['id']) ? $listingData['id'] : ''
			)
		);

		return $baseUrl . $uri;
	}

	/**
	 * get the URL for a listing entry
	 * @param array $data
	 * @return string
	 */
	public function getUrl(array $data)
	{
		return $this->url('detail', $data);
	}

	public function getById($id, $decorate = true)
	{
		$sql = "SELECT * FROM `:table_blockchain` WHERE `id` = :id";

		$sql = iaDb::printf($sql, array(
			'table_blockchain' => self::getTable(true),
			'id'               => (int)$id
		));

		$result = $this->iaDb->getRow($sql);
		$decorate && $this->_processValues($result, true);

		return $result;
	}
}
?>
