--
-- Table structure for table `sbr410_blockchain`
--

DROP TABLE IF EXISTS `sbr410_blockchain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_blockchain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_bin NOT NULL,
  `exchangeSymbol` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `website` mediumtext COLLATE utf8_bin NOT NULL,
  `color` varchar(245) COLLATE utf8_bin NOT NULL,
  `protocolId` int(11) NOT NULL,
  `signaturId` int(11) NOT NULL,
  `runtime` varchar(250) COLLATE utf8_bin NOT NULL,
  `isAPISupport` varchar(45) COLLATE utf8_bin NOT NULL,
  `blocktime` varchar(45) COLLATE utf8_bin NOT NULL,
  `isBlockRewards` varchar(45) COLLATE utf8_bin NOT NULL,
  `isAtomicSwap` varchar(45) COLLATE utf8_bin NOT NULL,
  `isSideChildChain` varchar(45) COLLATE utf8_bin NOT NULL,
  `isPrivacyFeature` varchar(45) COLLATE utf8_bin NOT NULL,
  `mainnetLaunched` varchar(45) COLLATE utf8_bin NOT NULL,
  `latestRelease` varchar(45) COLLATE utf8_bin NOT NULL,
  `isTokenAvailable` varchar(45) COLLATE utf8_bin NOT NULL,
  `transactionCost` varchar(250) COLLATE utf8_bin NOT NULL,
  `transactionPerformance` varchar(45) COLLATE utf8_bin NOT NULL,
  `scalabilityOfNetwork` varchar(45) COLLATE utf8_bin NOT NULL,
  `securityOfTransaction` varchar(45) COLLATE utf8_bin NOT NULL,
  `securityOfBlockchain` varchar(45) COLLATE utf8_bin NOT NULL,
  `permission` varchar(145) COLLATE utf8_bin NOT NULL,
  `isModularity` varchar(255) COLLATE utf8_bin NOT NULL,
  `isEcosystem` varchar(45) COLLATE utf8_bin NOT NULL,
  `energyConsumption` varchar(45) COLLATE utf8_bin NOT NULL,
  `isDecentralizedExchange` varchar(45) COLLATE utf8_bin NOT NULL,
  `isDistributedLedgerTechnology` varchar(255) COLLATE utf8_bin NOT NULL,
  `isIntegrationInLegacySystem` varchar(255) COLLATE utf8_bin NOT NULL,
  `typeOfCryptoTechnology` mediumtext COLLATE utf8_bin NOT NULL,
  `industryFocus` mediumtext COLLATE utf8_bin NOT NULL,
  `wallet` mediumtext COLLATE utf8_bin NOT NULL,
  `developerTeamSize` varchar(255) COLLATE utf8_bin NOT NULL,
  `isSupportTeam` varchar(255) COLLATE utf8_bin NOT NULL,
  `isMaintenanceRequired` mediumtext COLLATE utf8_bin NOT NULL,
  `maturity` mediumtext COLLATE utf8_bin NOT NULL,
  `proprietary` varchar(250) COLLATE utf8_bin NOT NULL,
  `licensing` varchar(45) COLLATE utf8_bin NOT NULL,
  `pricing` varchar(45) COLLATE utf8_bin NOT NULL,
  `isProductionReady` varchar(45) COLLATE utf8_bin NOT NULL,
  `storageCapacity` varchar(145) COLLATE utf8_bin NOT NULL,
  `partnershipAlliance` longtext COLLATE utf8_bin NOT NULL,
  `links` longtext COLLATE utf8_bin NOT NULL,
  `createdate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sbr410_category`
--

DROP TABLE IF EXISTS `sbr410_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `sbr410_hash`
--

DROP TABLE IF EXISTS `sbr410_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_hash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8_bin NOT NULL,
  `abbreviation` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `links` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `sbr410_protocol`
--

DROP TABLE IF EXISTS `sbr410_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_protocol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(25) COLLATE utf8_bin NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `launched` varchar(55) COLLATE utf8_bin NOT NULL,
  `runtime` varchar(200) COLLATE utf8_bin NOT NULL,
  `smartcontract` varchar(45) COLLATE utf8_bin NOT NULL,
  `pros` mediumtext COLLATE utf8_bin NOT NULL,
  `cons` mediumtext COLLATE utf8_bin NOT NULL,
  `links` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `sbr410_signatur`
--

DROP TABLE IF EXISTS `sbr410_signatur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_signatur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `links` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sbr410_socialmedia`
--

DROP TABLE IF EXISTS `sbr410_socialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sbr410_blockchain_category`
--

DROP TABLE IF EXISTS `sbr410_blockchain_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_blockchain_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockchainCategoryVersion` int(11) NOT NULL,
  `blockchainId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sbr410_blockchain_hash`
--

DROP TABLE IF EXISTS `sbr410_blockchain_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_blockchain_hash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockchainHashVersion` int(11) NOT NULL,
  `blockchainId` int(11) NOT NULL,
  `hashId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbr410_blockchain_socialmedia`
--

DROP TABLE IF EXISTS `sbr410_blockchain_socialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbr410_blockchain_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockchainSocialVersion` int(11) NOT NULL,
  `links` mediumtext COLLATE utf8_bin NOT NULL,
  `fkBlockchainId` int(11) NOT NULL,
  `fkSocialmediaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
