class NavBarController
	constructor:($location, $window, $rootScope)->
		vm= @
		$rootScope.place= (ruta)-> 
			$location.path().indexOf(ruta) is 0 || $location.path() == ruta
		$rootScope.backButton= ->
			if $location.path().indexOf('/work') is 0
				"./#/work"
			else if $location.path().indexOf('/about') is 0
				"./#/about"