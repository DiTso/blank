/**
 * header
 * 
 * sample header
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
<!DOCTYPE html>
<html>
<head>
	<title>[[if? &is=`[*meta_title*]:!empty` &then=`[*meta_title*]` &else=`[[if? &is=`[*longtitle*]:!empty` &then=`[*longtitle*]` &else=`[*pagetitle*]`]] - [(site_name)]`]]</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<base href="[(site_url)]">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	[[if? &is=`[*meta_keywords*]:!empty` &then=`<meta name="keywords" content="[*meta_keywords*]">`]] 
	[[if? &is=`[*meta_description*]:!empty` &then=`<meta name="description" content="[*meta_description*]">`]] 
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.0.47/jquery.fancybox.min.css">
	<link rel="stylesheet" type="text/css" href="assets/templates/default/css/style.css">
</head>
<body class="[[template]]">
	<div class="wrap">
		<div class="head-placeholder">
			<div class="head">
				<div class="container">
					<div class="pull-xs-left">
						<div class="logo">
							<a href="/"><img src="/assets/templates/default/images/logo.png" class="img-fluid"></a>
						</div>

						<div class="float-left show-on-top hidden-md-down text">
							[(head_text:addbreak)]
						</div>
					</div>

					<div class="pull-xs-right text-xs-right">
						<div class="wi-group phone">
							<i class="icon-phone"></i>
							[[splitRows? &in=`[(company_phone)]` &tpl=`phones`]]
						</div>

						<a href="#" data-toggle="modal" data-target="#callback" class="btn btn-hollow-theme callback">Заказать звонок</a>
					</div>
				</div>
			</div>
			
			<div class="head-menu">
				<div class="container">
					<div class="menu">
						[[DLMenu? 
							&config=`menu`
						]]
					</div>
				</div>
			</div>
		</div>
