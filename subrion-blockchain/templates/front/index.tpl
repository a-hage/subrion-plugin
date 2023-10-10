
{ia_add_media files='css: _IA_URL_modules/blockchain/templates/front/css/style'}
<!-- Ein Leeeres Containers -->
<div class="col-md-0 aside" style="height:20px;"></div>
<!-- Category Container -->
<div id="block_blockchains" class="blockchains box an a-info">
	<div id="block_categories" class="category box an a--info collapsible">
		<h4 id="caption_categories" class="box__caption">Blockchain filtern 
			<a class="minmax-toggle" href="#">
				<i></i>
			</a>
		</h4>
		<form  method="post" id="categoryFilter" class="ia-form">
            {preventCsrf}
			<div id="content_categories" class="box__content">
				<div class="ia-items">
					<div class="ia-item ia-item--border-bottom an-post">
						{$categoryArray = array_chunk($usedCategory,9)}
						{for $i=0 to count($categoryArray)-1}
							<div class="col-md-3">
								<div class="checkbox-inline">
									{for $k=0 to 8}
										<label>
											<input class="category_selector category" type="checkbox" name="category_filter[]" value="{strtolower($categoryArray[$i][$k].name)}" id="{$categoryArray[$i][$k].name}">
											{ucfirst($categoryArray[$i][$k].name)}
										</label><br/>
									{/for}	
								</div>
							</div>
						{/for}
					</div>
				</div>
				<div class="form-actions">
					<input type="submit" class="btn btn-primary" name="senden" value="senden">
					<input type="submit" class="btn btn-primary reset-button" name="reset" value="Reset">
				</div>
			</div>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-md-12" style="height:30px;">
		{if isset($categoryFilter) && !empty($categoryFilter)}
			{for $i=0 to count($categoryFilter)}
				<span class="">
					{if count($categoryFilter)== 1}
						<mark>{ucfirst($categoryFilter[$i])}</mark>
					{elseif $i lt count($categoryFilter)-1}
						<mark>{ucfirst($categoryFilter[$i])}</mark>{','}
					{else}
						<mark>{ucfirst($categoryFilter[$i])}</mark>
					{/if}
				</span>					
			{/for}							
		{/if}
	</div>
</div>	
<!-- Ein Leeeres Containers -->
<div class="col-md-0 aside" style="height:30px;"></div>																																		
<!-- Row Filter Data -->
<div class="row filter_data">
	<div class="row">
		{if isset($categoryFilter) && !empty($categoryFilter)}
			{if isset($blockchainFilter) && !empty($blockchainFilter)}
				{foreach $blockchainFilter as $blockchains}
					<div class="card card-block" style="margin-bottom: 10px; margin-top:10px;margin-left:5px;padding:1.25rem;border:1px solid rgba(0,0,0,.125);border-radius:.25rem;">
						<div class="row">
							<div class="col-md-2">
								<div class="row"> 
									<div class="col-md-12 col-sm-6">
										<a class="img-logo" href="{$blockchains.website}" rel="nofollow" target="_blank">
											<img alt="{$blockchains.name}" class="img-fluid" src="templates/kickstart/images/{strtolower($blockchains.name)}-logo.png" width="110px" height="110px">
										</a> 
									</div> 
									<div class="col-md-12 col-sm-6">
										<span class="limit-item" style="display: none;">You have selected the maximum of 4 products to compare</span>
										<div class="compare" data-name="{$blockchains.name}">
											<div class="add-to-compare" data-name="{$blockchains.name}" data-src="templates/kickstart/images/{strtolower($blockchains.name)}-logo.png" onclick="compareBox(this);showViewComparison(this);">Add to Compare</div>
										</div>
									</div> 
								</div>
							</div>
							<div class="col-md-10">
								<div class="row">
									<div class="d-flex justify-content-between flex-column flex-sm-row">
										<div class="col-md-6 col-sm-3">
											<h3 class="d-none d-lg-block">{$blockchains.name}</h3>
										</div>
										<div class="col-md-6 col-sm-3">
											<a class="btn btn-preferred text-truncate btn-block visit" href="{$blockchains.website}" rel="nofollow" target="_blank" style="width:50% !important;">Visit Website</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="d-none d-lg-block">
										<strong>Categories:</strong>
										<span>
											{if isset($blocks) && !empty($blocks)}
												{foreach $blocks as $block}
													{if $block.name == $blockchains.name}
														{for $i=0 to count($block.category)}
															{if count($block.category)==1 }
																{ucfirst($block.category[$i].name)}
															{/if}
															{if $i lt count($block.category)-1}
																	{ucfirst($block.category[$i].name)} {','}
																{else}
																	{ucfirst($block.category[$i].name)}
															{/if}					
														{/for}							
													{/if}
												{/foreach}
											{/if}
										</span>
									</div>
									<span class="d-none d-lg-block">{$blockchains.description} 
										<a name="info" id="{$blockchains.name}" href="{$smarty.const.IA_URL}blockchain/detail/?detail={$blockchains.name}">Learn more about {$blockchains.name}</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			{/if}
		{else}
			{if isset($items) && !empty($items) }
				{foreach $items as $item}
					<div class="card card-block" style="margin-bottom: 10px; margin-top:10px;margin-left:5px;padding:1.25rem;border:1px solid rgba(0,0,0,.125);border-radius:.25rem;">
						<div class="row">
							<div class="col-md-2">
								<div class="row"> 
									<div class="col-md-12 col-sm-6">
										<a class="img-logo" href="{$item.website}" rel="nofollow" target="_blank">
											<img alt="{$item.name}" class="img-fluid" src="templates/kickstart/images/{strtolower($item.name)}-logo.png" width="120px" height="120px">
										</a> 
									</div> 
									<div class="col-md-12 col-sm-6">
										<span class="limit-item" style="display: none;">You have selected the maximum of 4 products to compare</span>
										<div class="compare" data-name="{$item.name}">
											<div class="add-to-compare" data-name="{$item.name}" data-src="templates/kickstart/images/{strtolower($item.name)}-logo.png" onclick="compareBox(this);showViewComparison(this);">Add to Compare</div>
										</div>
									</div> 
								</div>
							</div>
							<div class="col-md-10">
								<div class="row">
									<!--<div class="col-md-12">-->
									<div class="d-flex justify-content-between flex-column flex-sm-row">
										<div class="col-md-6 col-sm-4">
											<h3>{$item.name}</h3>
										</div>
										<div class="col-md-6 col-sm-4">
											<a class="btn btn-preferred text-truncate btn-block" href="{$item.website}" rel="nofollow" target="_blank">Visit Website</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="d-none d-lg-block">
										<strong>Categories: </strong>
										<span>
											{if isset($blocks) && !empty($blocks)}
												{foreach $blocks as $block}
													{if $block.name == $item.name}
														{for $i=0 to count($block.category)}
															{if count($block.category)==1 }
																{ucfirst($block.category[$i].name)}
															{/if}
															{if $i lt count($block.category)-1}
																	{ucfirst($block.category[$i].name)}{','}
																{else}
																	{ucfirst($block.category[$i].name)}
															{/if}					
														{/for}							
													{/if}
												{/foreach}
											{/if}
										</span>
									</div> 
									<span class="d-none d-lg-block">{$item.description} 
										<a name="info" id="{$item.name}" href="{$smarty.const.IA_URL}blockchain/detail/?detail={$item.name}">Learn more about {$item.name}</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			{/if}
		{/if}
	</div>
</div>
<section id="compare-summary-box" class="stack section-blue-gray compare-section" style="display:none;">                       
	<div class="section-content section-content-thin">                                   
		<div class="grid">                                  
			<div class="cell one-whole">                                    
				<p class="color-text">Compare (<b id="summary-box-count"></b>) Blockchains has been added to compare.</p>                
			</div>                                    
			<div class="cell one-whole">                                     		 
				<ul class="blockchains-compare inline-block">
				
				</ul>                                      
				<div class="compare-section-actions inline-block">
					<a class="view-comparison" style="display: none;" onClick="getListItem(this);">Compare Now!</a>
					<a class="remove-all-items">Remove All</a>
				</div>
			</div> 
		</div>    
	</div>                        
</section>

{ia_print_js files='_IA_URL_modules/blockchain/js/addTocompaire'}
			
