class AboutProfileController
	constructor:->
		vm= @
		vm.workArticle= off;
		vm.aboutArticle= on;
		vm.sectionType= 'userProfile';