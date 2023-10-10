<!-- Category Container -->
<div id="block_blockchains" class="blockchains box an a-info">
	<div id="block_categories" class="category box an a--info collapsible">
		<h4 id="caption_categories" class="box__caption">blockchain nach Categories filtern 
			<a class="minmax-toggle" href="#">
				<i></i>
			</a>
		</h4>
		<!--<form method="post" id="categoryFilter" class="ia-form">-->
            {preventCsrf}
			<div id="content_categories" class="box__content">
				<div class="ia-items">
					<div class="ia-item ia-item--border-bottom an-post">
						{for $i=0 to count($usedCategory)-1}
							<input class="category_selector category" type="checkbox" name="category_filter" value="{strtolower($usedCategory[$i].name)}" id="{$usedCategory[$i].name}">
							<small class="d-inline-block text-truncate" for="{ucfirst($usedCategory[$i].name)}">{ucfirst($usedCategory[$i].name)}</small>
						{/for}
					</div>
				</div>
			</div>
			<div class="form-actions">
                <input type="submit" class="btn btn-primary" value="Filter">
                <input type="reset" class="btn btn-primary reset-button" value="Reset">
           </div>
		<!--</form>-->
	</div>
</div>
<!-- Ein Leeeres Containers -->
<div class="col-md-0 aside"></div>
															
