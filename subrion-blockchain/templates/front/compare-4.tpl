<div id="{$blockchainCompare[$i].name}" class="block col-md-3 col-sm-4 col-xs-6">
	<div class="brand-color" style="background-color:{$blockchainCompare[$i].color};"></div>
	<div class="header-list">
		<div class="logos-info" data-compare="{$blockchainCompare[$i].name}" >
			<a href="{$blockchainCompare[$i].website}">
				<img class="img-responsive img-fluid" title = "{$blockchainCompare[$i].name}" 
				alt="{$blockchainCompare[$i].name}" data-src="templates/kickstart/images/{strtolower($blockchainCompare[$i].name)}-logo.png" 
				src="templates/kickstart/images/{strtolower($blockchainCompare[$i].name)}-logo.png">
			</a>
		</div>
		<h3>
			<a href="{$blockchainCompare[$i].website}">
				{$blockchainCompare[$i].name}
			</a>
		</h3>
			<a class="remove-comparison">
			<div class="close_me" style="background-color:{$blockchainCompare[$i].color}">
				<i class="fa"></i>
			</div>
		</a>
		<a class="btn btn-primary btn-block btn-lg visit" href="{$blockchainCompare[$i].website}" target="_blank">Visit Website</a>
	</div>
	<hr style="float:left;width:100%;">
	<div class="technical-detail">
		<div class="header-info">
			<h3>Overview</h3>
			{*  Symbol *}
			<div class="technical-info-one">
				<label>Symbol &nbsp;&nbsp;
					<i class="fa fa-info icon-info-background" style="font-size:20px;" 
					data-toggle="tooltip" title="{$blockchainCompare[$i].description}" aria-hidden="true"></i>
				</label>
				<span class="technical" style="float:right;margin-right:5px;">{$blockchainCompare[$i].exchangeSymbol}</span>
			</div>		
			{* Category *}
			<h4>Category</h4>
			<div class="category-info">
				<span class="category">
					{if $blockchainCompare[$i].category|@count gt 2}
						{if strlen($blockchainCompare[$i].category[0]['name']) gt 15 || strlen($blockchainCompare[$i].category[1]['name']) gt 15 }
							{ucfirst($blockchainCompare[$i].category[0]['name'])} {'...'}
							<i class="fa fa-info icon-info-background" data-toggle="tooltip" 
							title="
								{for $k=0 to count($blockchainCompare[$i].category)}
									{if $k lt count($blockchainCompare[$i].category)-1} 
										{ucfirst($blockchainCompare[$i].category[$k]['name'])} {','} 
									{else} 
										{ucfirst($blockchainCompare[$i].category[$k]['name'])}
									{/if}
								{/for}
							 " style="font-size:20px; float:right;margin-right:5px";></i>
						{else}
							{ucfirst($blockchainCompare[$i].category[0]['name'])}{','} {ucfirst($blockchainCompare[$i].category[1]['name'])}{'...'}&nbsp;
							<i class="fa fa-info icon-info-background" data-toggle="tooltip" 
							title="
								{for $k=0 to count($blockchainCompare[$i].category)}
									{if $k lt count($blockchainCompare[$i].category)-1} 
										{ucfirst($blockchainCompare[$i].category[$k]['name'])} {','} 
									{else} 
										{ucfirst($blockchainCompare[$i].category[$k]['name'])}
									{/if}
								{/for}
							 " style="font-size:20px;float:right;margin-right:5px;" aria-hidden="true"></i>
						{/if}
					{else}
						{ucfirst($blockchainCompare[$i].category[0]['name'])}{','}{ucfirst($blockchainCompare[$i].category[1]['name'])}
					{/if}
				</span>
			</div>
			<hr>
			<h3>Technical-Detail</h3>
			{* Protocol *}
			<div class="technical-info-one">
				<label>Protocol</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{$blockchainCompare[$i].protocol[0]['abbreviation']}&nbsp;&nbsp;
					<i class="fa fa-info icon-info-background" data-toggle="tooltip" 
						title="{$blockchainCompare[$i].protocol[0]['name']}" aria-hidden="true">
					 </i>
				</span>
			</div>
			{* Hash-Function *}
			<div class="technical-info-one">
				<label>Hash-Function</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if $blockchainCompare[$i].hash|@count gt 1}
						{ucfirst($blockchainCompare[$i].hash[0]['name'])}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="
							{for $k=0 to count($blockchainCompare[$i].hash)}
								{if $k lt count($blockchainCompare[$i].hash) -1 }
									{ucfirst($blockchainCompare[$i].hash[$k]['name'])} {','} 
								{else} 
									{ucfirst($blockchainCompare[$i].hash[$k]['name'])}
								{/if}
							{/for}
							" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{ucfirst($blockchainCompare[$i].hash[0]['name'])}
					{/if}
				</span>
			</div>
			{* Signatur *}
			<div class="technical-info-one">
				<label>Signatur</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strlen($blockchainCompare[$i].signatur[0]['name']) gt 16}
						{$splitSignatur = explode(' ',$blockchainCompare[$i].signatur[0]['name'])}
						{$splitSignatur[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="{$blockchainCompare[$i].signatur[0]['name']}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{$blockchainCompare[$i].signatur[0]['name']}
					{/if}
				</span>
			</div>
			{* Runtime *}
			<div class="technical-info-one">
				<label>Runtime</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strlen($blockchainCompare[$i].runtime) gt 10}
						{$splitRuntime = explode(',',$blockchainCompare[$i].runtime)}
						{$splitRuntime[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="{$blockchainCompare[$i].runtime}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{$blockchainCompare[$i].runtime}
					{/if}
				</span>
			</div>
			{* Block-Time *}
			<div class="technical-info-one">
				<label>Blocktime</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{$blockchainCompare[$i].blocktime}
				</span>
			</div>
			{* Mainnet-Launched *}
			<div class="technical-info-one">
				<label>Mainnet Launched</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strlen($blockchainCompare[$i].mainnetLaunched) gt 10}
						{$splitMainnet = explode(',',$blockchainCompare[$i].mainnetLaunched)}
						{$splitMainnet[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="{$blockchainCompare[$i].mainnetLaunched}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{$blockchainCompare[$i].mainnetLaunched}
					{/if}
				</span>
			</div>
			{* Latest-Release *}
			<div class="technical-info-one">
				<label>Latest-Release</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{$blockchainCompare[$i].latestRelease}
				</span>
			</div>
			{* Transaction-Cost *}
			<div class="technical-info-one">
				<label>Transaction<br/> Cost</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strstr($blockchainCompare[$i].transactionCost,',')}
						{$splitTxtCost = explode(',',$blockchainCompare[$i].transactionCost)}
						{$splitTxtCost[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="{$blockchainCompare[$i].transactionCost}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{$blockchainCompare[$i].transactionCost}
					{/if}
				</span>
			</div>
			{* Transaction-Performance *}
			<div class="technical-info-one">
				<label>Transaction<br/> Performance</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strstr($blockchainCompare[$i].transactionPerformance,',')}
						{$spliteTxtPerformance = explode(',',$blockchainCompare[$i].transactionPerformance)}
						{$spliteTxtPerformance[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="{$blockchainCompare[$i].transactionPerformance}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{$blockchainCompare[$i].transactionPerformance}
					{/if}
				</span>
			</div>
			{* Energy-Consumption *}
			<div class="technical-info-one">
				<label>Energy<br/> Consumption</label>
				<span class="technical" style="float:right;margin-right:5px;">
						{$blockchainCompare[$i].energyConsumption}
				</span>
			</div>
			{* Licensing *}
			<div class="technical-info-one">
				<label>Licensing</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strlen($blockchainCompare[$i].licensing) gt 11}
						{$spliteLicensing = explode(' ',$blockchainCompare[$i].licensing)}
						{$spliteLicensing[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background" data-toogle="tooltip"
						title="{$blockchainCompare[$i].licensing}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{else}
						{$blockchainCompare[$i].licensing}
					{/if}
				</span>
			</div>
			{* Pricing *}
			<div class="technical-info-one">
				<label>Pricing</label>
				<span class="technical" style="float:right;margin-right:5px;">
						{$blockchainCompare[$i].pricing}
				</span>
			</div>
			{* Developer-Team-Size *}
			<div class="technical-info-one">
				<label>Developer<br/>Team Size</label>
				<span class="technical" style="float:right;margin-right:5px;">
					{if strstr($blockchainCompare[$i].developerTeamSize,',')}
						{$spliteTeamSize = explode(',',$blockchainCompare[$i].developerTeamSize)}
						{$spliteTeamSize[0]}{'...'}&nbsp;
						<i class="fa fa-info icon-info-background"data-toggle="tooltip"
						title="{$blockchainCompare[$i].developerTeamSize}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='large'}
						{$blockchainCompare[$i].developerTeamSize}
					{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='medium'}
						{$blockchainCompare[$i].developerTeamSize}
					{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='small'}
						{$blockchainCompare[$i].developerTeamSize}
					{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='no data'}
						{$blockchainCompare[$i].developerTeamSize}
					{/if}
				</span>
			</div>
			<hr>
			{* Production-Ready *}
			<div class="technical-info-two">
				<label>Production Ready</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isProductionReady) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isProductionReady) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isProductionReady}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isProductionReady) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isProductionReady}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isProductionReady) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isProductionReady}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* API-Support *}
			<div class="technical-info-two">
				<label>API Support</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isAPISupport) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isAPISupport) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isAPISupport}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isAPISupport) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isAPISupport}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isAPISupport) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isAPISupport}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Support-Team *}
			<div class="technical-info-two">
				<label>Support-Team</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isSupportTeam) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isSupportTeam) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isSupportTeam}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isSupportTeam) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isSupportTeam}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isSupportTeam) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isSupportTeam}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Block-Rewards *}
			<div class="technical-info-two">
				<label>Block-Rewards</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isBlockRewards) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isBlockRewards) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isBlockRewards}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isBlockRewards) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isBlockRewards}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isBlockRewards) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isBlockRewards}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Atomic-Swap *}
			<div class="technical-info-two">
				<label>Atomic-Swap</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isAtomicSwap) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isAtomicSwap) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isAtomicSwap}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isAtomicSwap) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isAtomicSwap}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isAtomicSwap) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isAtomicSwap}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Side- Child-Chain *}
			<div class="technical-info-two">
				<label>Side/Child-Chain</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isSideChildChain) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isSideChildChain) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isSideChildChain}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isSideChildChain) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isSideChildChain}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isSideChildChain) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isSideChildChain}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Privacy-Feature *}
			<div class="technical-info-two">
				<label>Privacy-Feature</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isPrivacyFeature) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isPrivacyFeature) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isPrivacyFeature}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isPrivacyFeature) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isPrivacyFeature}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isPrivacyFeature) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isPrivacyFeature}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Token-Available *}
			<div class="technical-info-two">
				<label>Token-Available</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isTokenAvailable) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isTokenAvailable) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isTokenAvailable}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isTokenAvailable) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isTokenAvailable}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isTokenAvailable) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isTokenAvailable}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Modularity *}
			<div class="technical-info-two">
				<label>Modularity</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isModularity) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isModularity) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isModularity}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isModularity) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isModularity}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isModularity) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isModularity}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* EcoSystem *}
			<div class="technical-info-two">
				<label>Eco-System</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isEcosystem) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isEcosystem) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isEcosystem}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isEcosystem) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isEcosystem}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isEcosystem) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isEcosystem}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Scalability-of-Network *}
			<div class="technical-info-two">
				<label>Scalability of Network</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].scalabilityOfNetwork) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].scalabilityOfNetwork) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].scalabilityOfNetwork}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].scalabilityOfNetwork) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].scalabilityOfNetwork}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].scalabilityOfNetwork) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].scalabilityOfNetwork}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Security-of-Transaction *}
			<div class="technical-info-two">
				<label>Security of Transaction</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].securityOfTransaction) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfTransaction) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].securityOfTransaction}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfTransaction) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].securityOfTransaction}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfTransaction) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].securityOfTransaction}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Security-of-Blockchain *}
			<div class="technical-info-two">
				<label>Security of Blockchain</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].securityOfBlockchain) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfBlockchain) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].securityOfBlockchain}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfBlockchain) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].securityOfBlockchain}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfBlockchain) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].securityOfBlockchain}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Permission *}
			<div class="technical-info-two">
				<label>Permission</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].permission) == 'permissioned'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].permission) == 'permissionless'}
						<i class="fa fa-times-circle icon-times-background"></i>
					{elseif strtolower($blockchainCompare[$i].securityOfBlockchain) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].permission}" aria-hidden="true"></i>		
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].permission}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Decentralized-Exchange *}
			<div class="technical-info-two">
				<label>Decentralized Exchange</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isDecentralizedExchange) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isDecentralizedExchange) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isDecentralizedExchange}" aria-hidden="true" ></i>
					{elseif strtolower($blockchainCompare[$i].isDecentralizedExchange) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isDecentralizedExchange}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isDecentralizedExchange) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>	
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isDecentralizedExchange}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Distributed-Ledger-Technology *}
			<div class="technical-info-two">
				<label>Distributed Ledger<br/> Technology</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isDistributedLedgerTechnology) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isDistributedLedgerTechnology) == 'in process'}
						<i class="fa fa-cog" data-toggle="tooltip" title="{$blockchainCompare[$i].isDistributedLedgerTechnology}" aria-hidden="true" ></i>
					{elseif strtolower($blockchainCompare[$i].isDistributedLedgerTechnology) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isDistributedLedgerTechnology}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isDistributedLedgerTechnology) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>		
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isDistributedLedgerTechnology}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			{* Integration-in-Legacy-System *}
			<div class="technical-info-two">
				<label>Integration in <br/>Legacy System</label>
				<span style="float:right;margin-right:5px;">
					{if strtolower($blockchainCompare[$i].isIntegrationInLegacySystem) == 'yes'}
						<i class="fa fa-check-circle icon-check-background"></i>
					{elseif strtolower($blockchainCompare[$i].isIntegrationInLegacySystem) == 'no data'}
						<i class="fa fa-question-circle" data-toggle="tooltip" title="{$blockchainCompare[$i].isIntegrationInLegacySystem}" aria-hidden="true"></i>
					{elseif strtolower($blockchainCompare[$i].isIntegrationInLegacySystem) == 'no'}
						<i class="fa fa-times-circle icon-times-background"></i>		
					{else}
						<i class="fa fa-info-circle icon-info-background" data-toggle="tooltip" title="{$blockchainCompare[$i].isIntegrationInLegacySystem}" aria-hidden="true"></i>
					{/if}
				</span>
			</div>
			<hr>
			{* Industry-Focus *}
			<div id="block_industryFocus" class="box an an--info collapsible">
				<h4 id="caption_industryFocus" class="box__caption">Industry-Focus
					<a href="#" class="minmax-toggle">
						<i></i>
					</a>
				</h4>
				<div id="content_industryFocus" class="box__content">				
					<div class="industry-info">
						{$spliteIndustryFocus = explode(',',$blockchainCompare[$i]['industryFocus'])}
							{for $k=0 to count($getIndustryFocus) -1}
								<div class="row industry-sector ">
									<label>{$getIndustryFocus[$k]}</label>
									<span class="sector">
										{if in_array($getIndustryFocus[$k],$spliteIndustryFocus)}															
											<i class="fa fa-check-circle icon-check-background"></i>
										{elseif 'No Data' == $getIndustryFocus[$k]}
											<i class="fa fa-question-circle" data-toggle="tooltip" title="No Data" aria-hidden="true"></i>
										{else}
											<i class="fa fa-times-circle icon-times-background"></i>
										{/if}
									</span>
								</div>
						{/for}
					</div>
				</div>
			</div>
			<hr>
			{* Wallet *}
			<div id="block_wallet" class="box an an--info collapsible">
				<h4 id="caption_wallet" class="box__caption">Wallet
					<a href="#" class="minmax-toggle">
						<i></i>
					</a>
				</h4>
				<div id="content_wallet" class="box__content">				
					<div class="wallet-info">
						{$wallet = explode(',',$blockchainCompare[$i]['wallet'])}
						<div class="wallet">
							{for $k=0 to count($wallet)-1}
								{if strstr($wallet[$k],"(")}
									{$walletContent = explode("(",$wallet[$k])}
										<div class="row">
											<label>{$walletContent[0]}</label>
											<div class="row" style="margin-left:20px;">
												{$content = explode(';',$walletContent[1])}
												{for $n=0 to count($content)-1}
								
													{if strstr($content[$n],")")}
														{$endContent = str_replace(")",'',$content[$n])}
														<span class="" style="margin-right:2px;">
															{$endContent}
														</span>
													{else}
														<span class="" style="margin-right:2px;">
															{$content[$n]}
														</span>
													{/if}
												{/for}
											</div>
										</div>
									{else}
										<div class="row">
											<label>{$wallet[$k]}</label>
										</div>	
									{/if}
								{/for}
						</div>
					</div>
				</div>
			</div>
			<hr>
			{* Partnership-Alliance *}
			<div id="block_partnership" class="box an an--info collapsible">
				<h4 id="caption_partnership" class="box__caption">Partnership-Alliance
					<a href="#" class="minmax-toggle">
						<i></i>
					</a>
				</h4>
				<div id="content_partnership" class="box__content">				
					<div class="partnership-info">
						{$partnershipAlliance = explode(',',$blockchainCompare[$i]['partnershipAlliance'])}
						<div class="partnership-alliance">
							{for $k=0 to count($partnershipAlliance)-1}
								<label>{$partnershipAlliance[$k]}</label>
								<br/>
							{/for}
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>
</div>
