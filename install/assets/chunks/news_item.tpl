/**
 * news_item
 * 
 * news item template
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
<li>
	<div class="news-item">
		<a href="[+url+]" class="image">
			<span style="background-image: url([[phpthumb? &input=`[+tv.thumb+]` &options=`w=635,h=355,zc=1,f=jpg`]]);"></span>
		</a>
		
		<div class="date">[[formatDate? &in=`[+pub_date+]`]]</div>
		
		<div class="title">
			<a href="[+url+]">[+pagetitle+]</a>
		</div>
		
		[+introtext+]
		
		<div class="further">
			<a href="[+url+]">Читать далее<i class="icon-right"></i></a>
		</div>
	</div>
