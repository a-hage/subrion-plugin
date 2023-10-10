//$(document).ready(function(){
			
			function compareBox(element){
				var i = 0;
				$('.compare').on('click',element,function(event){
					//console.log("Compare-Box");
					$('#compare-summary-box').css('display','block');
					var name = $(element)[0].attributes[1].value;
					var imagesrc = $(element)[0].attributes[2].value;
					i++;
					var HTML = "";
					if(i < 4){
					HTML += "<li class=\"blockchain-list\">";
					HTML += "<div class=\"blockchain-item\" data-name="+name+">";
					HTML += "<button class=\"remove-compare\" data-name="+name+" onClick=\"remove(this);\">";
					HTML += "<i class=\"material-icons\">X</i>";
					HTML += "</button>";
					HTML += "<span class=\"name-tooltip\" data-title="+name+">";
					HTML += "<div class=\"logo-container\">";
					HTML += "<div class=\"logo-container-img\">";
					HTML += "<img class=\"img-logo\" src="+imagesrc+" alt="+name+" title="+name+" width=90px; height=90px;>";
					HTML += "</div>";
					HTML += "</div>";
					HTML += "</span>";
					HTML += "</div>";
					HTML += "</li>";
				}
				var item_length = $('ul li.blockchain-list').length;
				//console.log(item_length);
					if(item_length >=0 && item_length < 4){
						$('.blockchains-compare').append(HTML);
						event.preventDefault();
						$('.compare').off('click');
						$(element).addClass('disabled');
						//$(element).unbind('click');
					}
					
					if(item_length ==3){
						event.preventDefault();
						$('.add-to-compare').addClass('disabled');	
						$('.compare').off('click');
						//$('.add-to-compare').unbind('click');
					}
					var count_item = item_length+1;
					$('#summary-box-count').html(count_item);
				});
			}
		
			function showViewComparison(element){
				var item_length = $('ul li.blockchain-list').length;
				//console.log($(element).parent().prev()[0].className);
				if(item_length > 0){
					$('.view-comparison').css('display','inline-block');
				}else{
					$('.view-comparison').css('display','none');
				}
				if(item_length == 3){
					$($(element).parent().prev()[0]).css('display','block');
				} else{
					$($(element).parent().prev()[0]).css('display','none');
				}  
			}
		
			function getData(){
				$('.compare').bind('click',function(){
					//console.log("abdo Test");
					var name = $(this).data();
					//console.log(name);
				});
				return name;
			}
			
			/*
			 * 	<!-- class="remove-all-items" onClick="removeAll();">Remove All</a>-->
			function removeAll(){
				$('.blockchains-compare').html('');
				$('#compare-summary-box').css('display','none');
				//$('#compare-summary-box').hide();
				$('.limit-item').css('display','none');
				$('.add-to-compare').removeClass('disabled');	
				window.location.reload(true);
			}
			*/

				$('.remove-all-items').on('click',function(){
					$('.blockchains-compare').html('');
					$('#compare-summary-box').css('display','none');
					//$('#compare-summary-box').hide();
					$('.limit-item').css('display','none');
					$('.add-to-compare').removeClass('disabled');	
					//window.location.reload(true);
				});
			
			
			
			function remove(element){
				obj = $('.blockchain-item');
				var data_attr = $(element).attr('data-name');
				var isTrue = false;
				//console.log(element);
				if(!isTrue){
					$('li .blockchain-item').removeClass('clicked');
					event.preventDefault();
				}
				var item_length = $('ul li.blockchain-list').length;
				//console.log(item_length);
				$('.remove-compare').on('click',{'data':obj},function(event){
					var name = $(element).data('name');
					var li_item = item_length - 1;
					for(var i=0;i<event.data.data.length;i++){
						$(element).parent().removeClass('clicked');
						//console.log(event.data.data[i].attributes[1].nodeValue);
						if(name == event.data.data[i].attributes[1].nodeValue){
							$(element).parent().addClass('clicked');
							$('.clicked').parent().remove();
							$('.add-to-compare').removeClass('disabled');	
							//$('.compare').on('click');
							//event.preventDefault();
							$('#summary-box-count').html(li_item);
						}else{
							$('li .blockchain-item').removeClass('clicked');
							event.preventDefault();
						}
						if(item_length == 1){
							$('#compare-summary-box').css('display','none');
						}
						if(item_length == 4){
							$('.limit-item').css('display','none');
						}
						if(li_item < 2){
							$('.view-comparison').css('display','none');
						}else{
							$('.view-comparison').css('display','inline-block');
						}
					}
				});
			}
		
			function getListItem(element){
				var param = [];
				var item_length = $('ul li.blockchain-list').length;
				var li_List = $('ul li.blockchain-list');
				for(var i=0; i < li_List.length; i++){
					//console.log(li_List[i].children[0].dataset.name);
					param.push(li_List[i].children[0].dataset.name);	
				}
				var href_Url = '../subrion/blockchain/compare/?compare='+param;
				//console.log(href_Url);
				$(element).attr('href',href_Url);
				//$('.limit-item').css('display','none');
			}

//});
