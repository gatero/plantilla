class WorkArticleController
	constructor:($location, $window, $rootScope)->
		vm= @
		vm.workArticle= on;
		vm.aboutArticle= off;
		vm.sectionType= 'workArticle';