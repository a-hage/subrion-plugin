
{ia_add_media files='css: _IA_URL_modules/blockchain/templates/front/css/style'}
<!-- Begin Tab -->
<div class="tabbable">
    <!-- Begin Nav-Tabs -->
    <ul id="tab-info" class="nav nav-tabs" role="tablist">
        <li class="active">
			<a id="overview-tab" data-toggle="tab" role="tab" href="#overview">
				<span>Overview</span>
			</a>
		</li>
		<li>
			<a id="feature-tab" data-toggle="tab" role="tab" href="#feature">
				<span>Feature</span>
			</a>
		</li>
    </ul>
    <!-- End Nav-Tabs -->

	<!-- Begin Tab-Content -->
	<div class="tab-content">
		<!-- Begin Overview -->
		<div id="overview" class="tab-pane active" role="tabpanel">
			<!-- Begin Tabs-Content-Wrapper -->
			<div class="tabs-content-wrapper">
				<!-- Begin Overview-Details -->
				<div class="overview-detail">
					{if isset($blockchainInfo) && !empty($blockchainInfo)}
						{foreach $blockchainInfo as $info}
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Website</div>
									<div class="info-text"><a href="{$info.website}" target="_blank">{$info.name}</a></div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Protocol</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Hash</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['hash'] as $hash}
											{$hash.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Signatur</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['signatur'] as $signatur}
											{$signatur.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Category</div>
									<div class="info-text" style="height: 50px;">
									{foreach $info['category'] as $category}
											{$category.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Runtime</div>
									<div class="info-text" style="height: 50px;">{$info.runtime}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">API-support</div>
									<div class="info-text" style="height: 50px;">{$info.isAPISupport}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Blok-Time</div>
									<div class="info-text" style="height: 50px;">{$info.blocktime}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Block-Rewards</div>
									<div class="info-text" style="height: 50px;">{$info.isBlockRewards}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Atomic-Swap</div>
									<div class="info-text" style="height: 50px;">{$info.isAtomicSwap}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
										<div class="info-box"><div class="info-label">Token-Available</div>
										<div class="info-text" style="height: 50px;">{$info.isTokenAvailable}</div>
									</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Txt Cost</div>
									<div class="info-text" style="height: 50px;">{$info.transactionCost}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Txt Performance</div>
									<div class="info-text" style="height: 50px;">{$info.transactionPerformance}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Scalability of Net</div>
									<div class="info-text" style="height: 50px;">{$info.scalabilityOfNetwork}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Security of Txt</div>
									<div class="info-text" style="height: 50px;">{$info.securityOfTransaction}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Security of Block</div>
									<div class="info-text" style="height: 50px;">{$info.securityOfBlockchain}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Permission</div>
									<div class="info-text" style="height: 50px;">{$info.permission}</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Modularity</div>
									<div class="info-text" style="height: 50px;">{$info.isModularity}</div>
								</div>
							</div>
						{/foreach}	
					{/if}
				</div>
				<!-- End Overview-Details -->
			</div>
			<!-- End Tabs-Content-Wrapper -->
			<!-- Begin About-Container --> 
			<div class="card-detail">
				<div class="card" style="padding: 5px;">
					<div class="card-body">
						<div class="card-title">
							<h4 class="text-left">About {$info.name}</h4>
						</div>
						<div class="card-body-value">
							{$info.description}
						 </div>	
					</div>
				</div>
			</div>
			<!-- End About-Container -->
		</div>
		<!-- End Overviews -->
	  
		<!-- Begin Feature -->
		<div id="feature" class="tab-pane" role="tabpanel">
			<!-- Begin Tabs-Content-Wrapper -->
			<div class="tabs-content-wrapper">
				<!-- Begin Feature-Details -->
				<div class="feature-detail">
					{if isset($blockchainInfo) && !empty($blockchainInfo)}
						{foreach $blockchainInfo as $info}
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Hash Test</div>
									<div class="info-text" style="height: 50px;">
										<a href="{$info.website}" target="_blank">{$info.name}</a>
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Digital Test</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Hash Function</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Test Network</div>
									<div class="info-text" style="height: 50px;">
										{$info.name}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Test Signatur</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Hash Hash</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Test Network</div>
									<div class="info-text" style="height: 50px;">
										{$info.name}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Test Signatur</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Hash Hash</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Test Network</div>
									<div class="info-text" style="height: 50px;">
										{$info.name}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Test Signatur</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
							<div class="col-md-2 col-sm-3 col-xs-4">
								<div class="info-box">
									<div class="info-label">Hash Hash</div>
									<div class="info-text" style="height: 50px;">
										{foreach $info['protocol'] as $protocol}
											{$protocol.name}
										{/foreach}
									</div>
								</div>
							</div>
						{/foreach}	
					{/if}
				</div>
				<!-- End Feature-Details -->
			</div>
			<!-- End tabs-Content -->
		</div>
		 <!-- End Feature -->		 
	</div>
	<!-- End Tab-Content --> 
</div>
<!-- End TabTable -->

{ia_add_js}

	$('#tab-info li a').on('click', function(event) {
		//console.log(event);
		event.preventDefault();
		$(this).tab('show');
	});
	
	var heighest_infoTextElement = 0;
	// Prüfe, welches Element am höchsten ist
	$('.info-box .info-text').each(function() {
	  if ($(this).height() > heighest_infoTextElement) {
		heighest_infoTextElement = $(this).height();
	  }
	});

	// Weise diese Höhe allen Elementen zu.
	$('.info-box .info-text').each(function() {
	  $(this).height(heighest_infoTextElement);
	});
{/ia_add_js}



