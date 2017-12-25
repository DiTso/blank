/**
 * breadcrumbs
 * 
 * breadcrumbs
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
[[DLCrumbs?
	&sysKey=`crumbs`
	&urlScheme=`full`
	&showCurrent=`1`
	&addWhereList=`c.id != 1`
	&tpl=`@CODE: <a href="[+url+]" title="[+e.title+]">[+title+]</a><span class="separator">&mdash;</span>`
	&tplCurrent=`@CODE: <span class="current">[+title+]</span>`
	&ownerTPL=`@CODE: <div class="breadcrumbs">[+crumbs.wrap+]</div>`
]]
