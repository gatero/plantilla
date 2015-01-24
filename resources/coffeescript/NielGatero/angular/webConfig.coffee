angular
	.module 'SiteInfoApp', ['ngRoute']
	.config ['$routeProvider', routeConfig]
	.controller ['$http', ContentController]
	.controller ['$http', WorkArticleController]
	.controller ['$location', '$rootScope', NavBarController]