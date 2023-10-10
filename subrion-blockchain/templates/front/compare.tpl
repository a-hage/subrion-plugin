{ia_add_media files='css: _IA_URL_modules/blockchain/templates/front/css/style'}
<!-- Begin Compare-Container -->
<div id="compare" class="row">
    {if isset($blockchainCompare) && !empty($blockchainCompare)}
		{if $blockchainCompare|@count gt 4}
			<div class="error">
				<h3>Access denied</h3>
			</div>
		{elseif $blockchainCompare|@count == 4}
			{foreach $blockchainCompare as $compare4}
				{for $i=0 to count($compareName)-1}
					{if $compareName[$i] == $compare4.name}
						{include './compare-4.tpl'}
					{/if}
				{/for}
			{/foreach}
		{elseif $blockchainCompare|@count == 3}
			<div class="hidden-xs">
				{foreach $blockchainCompare as $compare3}
					{for $i=0 to count($compareName)-1}
						{if $compareName[$i] == $compare3.name}
							{include './compare-3.tpl'}
						{/if}
					{/for}
				{/foreach}
			</div>
			<div class="visible-xs">
				<div class="table-responsive" style="overflow-x:auto; overflow-y:auto;">
					<table class="table">
						<thead>
							<tr>
								{foreach $blockchainCompare as $compare3}
									{for $i=0 to count($compareName)-1}
										{if $compareName[$i] == $compare3.name}
											<td class="icons-info" data-compare="{$blockchainCompare[$i].name}" style="border-top:4px solid {$blockchainCompare[$i].color};">
												<a href="{$blockchainCompare[$i].website}">
													<img class="img-responsive img-fluid" title = "{$blockchainCompare[$i].name}" 
														alt="{$blockchainCompare[$i].name}" data-src="templates/kickstart/images/{strtolower($blockchainCompare[$i].name)}-logo.png" 
														src="templates/kickstart/images/{strtolower($blockchainCompare[$i].name)}-logo.png" style="width:50px;height:50px;">
												</a>
											</td>
											<td style="vertical-align:middle; border-top:4px solid {$blockchainCompare[$i].color};"><a href="{$blockchainCompare[$i].website}">{$blockchainCompare[$i].name}</a></td>
										{/if}
									{/for}
								{/foreach}
							</tr>
						</thead>
						
						<tbody>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20% !important;">Symbol</td><td>{$blockchainCompare[$i].exchangeSymbol}</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20%;">Category</td>
										<td class="inline-block">
										{if $blockchainCompare[$i].category|@count gt 1}
											<i class="fa fa-info icon-info-background" data-toggle="tooltip" 
												title="
												{for $k=0 to count($blockchainCompare[$i].category)}
													{if $k lt count($blockchainCompare[$i].category)-1} 
														{ucfirst($blockchainCompare[$i].category[$k]['name'])} {','} 
													{else} 
														{ucfirst($blockchainCompare[$i].category[$k]['name'])}
													{/if}
												{/for}
												 " style="font-size:14px; float:right;margin-right:5px";></i>
										{else}
												{ucfirst($blockchainCompare[$i].category[0]['name'])}
										{/if}
											{ucfirst($blockchainCompare[$i].category[0]['name'])}
									</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20%;">Protocol</td>
										<td>
											{$blockchainCompare[$i].protocol[0]['abbreviation']}&nbsp;&nbsp;
											<i class="fa fa-info icon-info-background" data-toggle="tooltip" 
												title="{$blockchainCompare[$i].protocol[0]['name']}" aria-hidden="true">
											 </i>
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>	
						
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20%;">Hashing</td>
										<td>
											{if $blockchainCompare[$i].hash|@count gt 1}
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
													{ucfirst($blockchainCompare[$i].hash[0]['name'])}
											{else}
												{ucfirst($blockchainCompare[$i].hash[0]['name'])}
											{/if}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20%;">Signatur</td>
										<td>
											{if strlen($blockchainCompare[$i].signatur[0]['name']) gt 16}
												{$splitSignatur = explode(' ',$blockchainCompare[$i].signatur[0]['name'])}
												
												<i class="fa fa-info icon-info-background" data-toogle="tooltip"
												title="{$blockchainCompare[$i].signatur[0]['name']}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
												{$splitSignatur[0]}
											{else}
												{$blockchainCompare[$i].signatur[0]['name']}
											{/if}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20%;">Runtime</td>
										<td>
											{if strlen($blockchainCompare[$i].runtime) gt 10}
												{$splitRuntime = explode(',',$blockchainCompare[$i].runtime)}
												
												<i class="fa fa-info icon-info-background" data-toogle="tooltip"
												title="{$blockchainCompare[$i].runtime}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
												{$splitRuntime[0]}
											{else}
												{$blockchainCompare[$i].runtime}
											{/if}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td style="width:20%;">Blocktime</td>
										<td>
											{$blockchainCompare[$i].blocktime}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>M. Launched</td>
										<td>
											{if strlen($blockchainCompare[$i].mainnetLaunched) gt 10}
												{$splitMainnet = explode(',',$blockchainCompare[$i].mainnetLaunched)}
												<i class="fa fa-info icon-info-background" data-toogle="tooltip"
												title="{$blockchainCompare[$i].mainnetLaunched}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
												{$splitMainnet[0]}
											{else}
												{$blockchainCompare[$i].mainnetLaunched}
											{/if}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
							
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>L. Release</td>
										<td>
											{$blockchainCompare[$i].latestRelease}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>Trxt. Cost</td>
										<td>
											{$blockchainCompare[$i].transactionCost}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>Trxt. Performance</td>
										<td>
											{$blockchainCompare[$i].transactionPerformance}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>En. Consumption</td>
										<td>
											{$blockchainCompare[$i].energyConsumption}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>Licensing</td>
										<td>
											{if strlen($blockchainCompare[$i].licensing) gt 11}
												{$spliteLicensing = explode(' ',$blockchainCompare[$i].licensing)}
												<i class="fa fa-info icon-info-background" data-toogle="tooltip"
												title="{$blockchainCompare[$i].licensing}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
												{$spliteLicensing[0]}
											{else}
												{$blockchainCompare[$i].licensing}
											{/if}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>Pricing</td>
										<td>
											{$blockchainCompare[$i].pricing}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>Dev. Team-Size</td>
										<td>
											{if strstr($blockchainCompare[$i].developerTeamSize,',')}
												{$spliteTeamSize = explode(',',$blockchainCompare[$i].developerTeamSize)}
												<i class="fa fa-info icon-info-background"data-toggle="tooltip"
												title="{$blockchainCompare[$i].developerTeamSize}" style="font-size:20px:float:right;margin-right:5px;" aria-hidden="true"></i>
												{$spliteTeamSize[0]}
											{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='large'}
												{$blockchainCompare[$i].developerTeamSize}
											{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='medium'}
												{$blockchainCompare[$i].developerTeamSize}
											{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='small'}
												{$blockchainCompare[$i].developerTeamSize}
											{elseif strtolower($blockchainCompare[$i].developerTeamSize) =='no data'}
												{$blockchainCompare[$i].developerTeamSize}
											{/if}
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						<tr>
							{foreach $blockchainCompare as $compare3}
								{for $i=0 to count($compareName)-1}
									{if $compareName[$i] == $compare3.name}
										<td>Production-Ready</td>
										<td>
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
										</td>
									{/if}
								{/for}
							{/foreach}
						</tr>
						
					</tbody>
				</table>
			</div>	
		</div>
		{elseif $blockchainCompare|@count == 2}
			{foreach $blockchainCompare as $compare2}
				{for $i=0 to count($compareName) -1}
					{if $compareName[$i] == $compare2.name}
						{include './compare-2.tpl'}
					{/if}
				{/for}
			{/foreach}
		{/if}
	{/if}	
</div>
<!-- End Compare-Container -->
<div class="row"></div>
{ia_add_js}
	$('.fa-info-circle').tooltip({
		placement : 'right'
	});
	$('.fa-info').tooltip({
		placement : 'right'
	});
	
		var heighest_description = 0;
	// Prüfe, welches Element am höchsten ist
	$('.col-description').each(function() {
	  if ($(this).height() > heighest_description) {
		heighest_description = $(this).height();
	  }
	});
	// Weise diese Höhe allen Elementen zu.
	$('.col-description').each(function() {
	  $(this).height(heighest_description);
	});
	
	var heighest_category = 0;
	// Prüfe, welches Element am höchsten ist
	$('.col-category').each(function() {
	  if ($(this).height() > heighest_category) {
		heighest_category = $(this).height();
	  }
	});
	// Weise diese Höhe allen Elementen zu.
	$('.col-category').each(function() {
	  $(this).height(heighest_category);
	});
	
	var heighest_walletElement = 0;
	// Prüfe, welches Element am höchsten ist
	$('.wallet-info').each(function() {
	  if ($(this).height() > heighest_walletElement) {
		heighest_walletElement = $(this).height();
	  }
	});
	// Weise diese Höhe allen Elementen zu.
	$('.wallet-info').each(function() {
	  $(this).height(heighest_walletElement);
	});
	var heighest_partnerElement = 0;
	// Prüfe, welches Element am höchsten ist
	$('.partnership-alliance').each(function() {
	  if ($(this).height() > heighest_partnerElement) {
		heighest_partnerElement = $(this).height();
	  }
	});
	// Weise diese Höhe allen Elementen zu.
	$('.partnership-alliance').each(function() {
	  $(this).height(heighest_partnerElement);
	});
	

				
{/ia_add_js}
