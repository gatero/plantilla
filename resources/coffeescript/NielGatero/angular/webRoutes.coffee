routeConfig= ($routeProvider)->
	$routeProvider
		.when '/home',
			controller: 'ContentController'
			controllerAs: 'vm'
			templateUrl: "/home"
		.when '/work',
			controller: 'ContentController'
			controllerAs: 'vm'
			templateUrl: "/work"
		.when '/about',
			controller: 'ContentController'
			controllerAs: 'vm'
			templateUrl: "/about"
		.when '/work-article/:articleId',
			controller: 'WorkArticleController'
			controllerAs: 'vm'
			templateUrl: (params)-> "/work-article/#{params.articleId}"
		.when '/profile/:profileId',
			controller: 'AboutProfileController'
			controllerAs: 'vm'
			templateUrl: (params)-> "/profile/#{params.profileId}"
		.otherwise
			redirectTo: '/home'