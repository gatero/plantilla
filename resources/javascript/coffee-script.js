
/* @Bootstrap */

/* @Quetzal */

/* @NielGatero */





/*
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
 */
var mk;

mk = (function() {
  function mk() {}

  mk.prototype.array = function(data, out, div1, div2) {

    /*
    			-------------------------------------------------------
    			Generrar arreglos desde un atributo html
    			-------------------------------------------------------
    
    			- Para utilizar esta función se necesita un array
    				para generar las propiedades de cada instancia.
    
    				HTML: 
    					<div id="foo" data-config='var1->2&&var2->5'></div>
    
    				Coffee:
    					option= new Array
    					mk::array($('#try').attr('data-config'), option)
    
    				Usage example:
    					something: option.var1
    
    			-------------------------------------------------------
    			Generar cadenas de parametros desde un atributo html
    			-------------------------------------------------------
    
    			- Tambien podemos generar parametros URL, para esto
    				solo necesitamos incluir el parametro data
    
    				HTML: 
    					<div id="foo" data-params='var1->2&&var2->5'></div>
    				Coffee:
    					params= mk::array $('#try').attr('data-params')
    
    					la salida es: &var1=2&var2=5
     */
    var error, i, params, put, _i, _ref;
    try {
      div1 = div1 ? div1 : '|';
      div2 = div2 ? div2 : '->';
      data = data.split(div1);
      if (!out) {
        params = '';
      }
      for (i = _i = 0, _ref = data.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        put = data[i].split(div2);
        if (out) {
          out[put[0].trim()] = put[1].trim();
        } else {
          if (put[1].trim() !== '' && put[1].trim() !== 'null' && put[1].trim() !== 'undefined' && put[1].trim() !== 'false') {
            params += "&" + (put[0].trim()) + "=" + (put[1].trim());
          }
        }
      }
      if (params !== '') {
        return params;
      }
    } catch (_error) {
      error = _error;
      return console.log("- Error en mk::array, " + error);
    }
  };

  mk.prototype.key = function(keySize, special) {

    /*
    			- Para generar un cadenas de caracteres aleatoria
    				Solo indicamos la longitud en valor numerico, 
    				e indicamos si tendra caracteres especiales.
    
    				Coffee:
    					console.log mk::key 7, yes
     */
    var iteration, number, password;
    iteration = 0;
    password = "";
    number = true;
    if (special) {
      special = false;
    }
    while (iteration < keySize) {
      number = (Math.floor(Math.random() * 100) % 94) + 33;
      if (!special) {
        if (number >= 33 && number <= 47) {
          continue;
        }
        if (number >= 58 && number <= 64) {
          continue;
        }
        if (number >= 91 && number <= 96) {
          continue;
        }
        if (number >= 123 && number <= 126) {
          continue;
        }
        iteration++;
        password += String.fromCharCode(number);
      }
    }
    return password;
  };

  mk.prototype.name = function(name) {

    /*
    			- Para generar nombres con una cadena de caracteres
    				aleatoria solo se requiere untroducir un nombre o dejar el nombre por defecto
    
    				Coffee:
    					console.log mk::name('foo')
     */
    name = name ? name : 'default name';
    name = name.replace(/\s/g, "_");
    name = "" + name + "_" + (this.key(5));
    return name;
  };

  mk.prototype.lock = function(target) {
    return $('body').on('contextmenu', target, function(event) {
      return event.preventDefault();
    });
  };

  return mk;

})();

$('[href="#"][type="button"]').click(function(event) {
  return event.preventDefault();
});


/*
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 2.4
 */
var LockMask;

LockMask = (function() {
  function LockMask() {}

  LockMask.prototype.loader = {
    anim: function() {
      var obj;
      obj = new CanvasLoader('lock-mask');
      obj.setColor('#D8D8D8');
      obj.setShape('square');
      obj.setDiameter(35);
      obj.setDensity(12);
      obj.setRange(1.2);
      obj.setFPS(9);
      return obj.show();
    },
    box: '<div id="lock-mask" class="lock-mask">'
  };

  LockMask.prototype.block = function() {
    var blockHeight, blockWidth, posLeft, posTop, scope;
    scope = this;
    blockHeight = $(scope.option.container).outerHeight();
    blockWidth = $(scope.option.container).outerWidth();
    posLeft = $(scope.option.container).position().left;
    posTop = $(scope.option.container).position().top;
    if (scope.option.block === 'body') {
      blockHeight = $(document).height();
      blockWidth = $(document).width();
      posLeft = '0px';
      posTop = '0px';
    }
    scope.loader.anim();
    return $(scope.option.block + ' #lock-mask').css({
      'position': 'absolute',
      'height': blockHeight,
      'width': blockWidth,
      'left': posLeft,
      'top': posTop
    }).fadeIn('slow').on('contextmenu', function(event) {
      return event.preventDefault();
    });
  };

  return LockMask;

})();


/*
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 2.1

	- Parametros de configuracion

		type: ajax, success, primary, warning, danger, info, muted
		
		color: si es ajax puede ser, success, primary, warning, danger, info, muted

		title: String

		content: String(solo si type no es ajax)
		
		size: String(opcional sus valores pueden ser modal-lg o modal-sm)

		icon: este icono se mostrara en el titulo y en el boton aceptar

		URL: Si es ajax, se mostrara en  el body de la modal el resultado,
		si es otro tipo, esta url se asigna al boton aceptar.
		
		controls: off( para evitar que se agregue el footer)
 */
var AjaxModal;

AjaxModal = (function() {
  function AjaxModal() {}

  AjaxModal.prototype.modal = function(option) {
    return "<div class='modal fade' id='AjaxModal'>\n	<div class='modal-dialog " + option.size + "'>\n		<div class='modal-content'>\n			<div class='modal-header bg-" + option.color + "'>\n				<button type='button' class='close' data-dismiss='modal'>\n					<i class='fa fa-times'></i>\n				</button>\n				<h4 class='modal-title text-" + option.color + "'><i class=\"fa fa-" + option.icon + "\"></i> " + option.title + "</h4>\n			</div>\n			<div class='modal-body'>" + option.content + "</div>							\n			<div class='modal-footer'>" + option.footer + "</div>\n		</div>\n	</div>\n</div>";
  };

  AjaxModal.prototype.options = function(option) {
    if (option.type === 'ajax') {
      return "<a href='#' class='btn btn-" + option.color + "' data-dismiss='modal'><i class='fa fa-sign-out fa-fw'></i> Cerrar</a>";
    } else {
      return "<div class='btn-group'>\n	<a href='" + option.url + "' class='btn btn-" + option.color + " btn-sm'> <i class=\"fa fa-" + option.icon + " fa-fw\"></i> Continuar</a>\n	<a href='#' class='btn btn-default btn-sm' data-dismiss='modal'> <i class=\"fa fa-sign-out fa-fw\"></i> Cancelar</a>\n</div>";
    }
  };

  AjaxModal.prototype.start = function() {
    var option, scope;
    option = new Array;
    scope = this;
    return $('body').on('click', '[data-modal]', function(event) {
      var error;
      event.preventDefault();
      try {
        $('#AjaxModal').remove();
        mk.prototype.array($(this).attr('data-modal'), option);
        if (option.type === 'ajax') {
          $.ajax({
            type: 'POST',
            cache: false,
            url: option.url,
            success: function(data) {
              option.content = data;
              option.size = !option.size ? '' : 'modal-' + option.size;
              option.footer = option.controls !== 'off' ? scope.options(option) : '';
              option.color = option.color ? option.color : option.type;
              $(scope.modal(option)).appendTo('body');
              option.title = !option.title ? '' : option.title;
              return $('#AjaxModal').modal('show');
            }
          });
        } else {
          option.size = !option.size ? 'modal-sm' : 'modal-' + option.size;
          option.footer = option.controls !== 'off' ? scope.options(option) : '';
          option.color = option.color ? option.color : option.type;
          $(scope.modal(option)).appendTo('body');
        }
        return $('#AjaxModal').modal('show');
      } catch (_error) {
        error = _error;
        return console.log("- Error en AjaxModal, " + error);
      }
    });
  };

  return AjaxModal;

})();

AjaxModal = new AjaxModal;

AjaxModal.start();

$('body').on('click', '.lock', function(event) {
  return event.preventDefault();
});


/* @JavaScript and @jQuery */


/* @JavaScript and @AngularJs */

var SiteCanvasContainer, siteCanvasContainer;

SiteCanvasContainer = (function() {
  function SiteCanvasContainer() {
    this.num = 120;
    this.margenAncho = ($(window).width() * 2) / 100;
    this.margenAlto = ($(window).height() * 30) / 100;
    this.SiteCanvasContainer = $('.SiteCanvasContainer');
  }

  SiteCanvasContainer.prototype.starHtml = function(id) {
    return "<div class='star' id='star-" + id + "'></div>";
  };

  SiteCanvasContainer.prototype.randomValuesFor = function(target) {
    var randomLeft, randomSize, randomTop, scope;
    scope = this;
    randomLeft = Math.floor((Math.random() * ($(window).width() - scope.margenAncho)) + 1);
    randomTop = Math.floor((Math.random() * ($(window).height() - scope.margenAlto)) + 1);
    randomSize = Math.floor((Math.random() * 7) + 1);
    return $(target).css({
      'left': randomLeft,
      'top': randomTop,
      'width': randomSize,
      'height': randomSize
    });
  };

  SiteCanvasContainer.prototype.createStars = function() {
    var scope, starNum, _i, _ref, _results;
    scope = this;
    _results = [];
    for (starNum = _i = 0, _ref = scope.num - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; starNum = 0 <= _ref ? ++_i : --_i) {
      scope.SiteCanvasContainer.prepend(scope.starHtml(starNum));
      _results.push(scope.starsPosition(starNum));
    }
    return _results;
  };

  SiteCanvasContainer.prototype.starsPosition = function(starNum) {
    var scope, star;
    scope = this;
    star = "#star-" + starNum;
    return scope.randomValuesFor(star);
  };

  SiteCanvasContainer.prototype.animateStars = function() {
    var scope, star, starAnimate, starNum, _i, _ref, _results;
    scope = this;
    _results = [];
    for (starNum = _i = 0, _ref = 80 - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; starNum = 0 <= _ref ? ++_i : --_i) {
      starAnimate = Math.floor((Math.random() * scope.num) + 1);
      star = $(".star:eq(" + starAnimate + ")");
      if (!star.hasClass('starShining')) {
        _results.push(star.addClass('starShining'));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  SiteCanvasContainer.prototype.animateAstro = function() {
    var scope;
    scope = this;
    return setInterval(function() {
      var cometa;
      cometa = '#star-cometa';
      scope.SiteCanvasContainer.append(scope.starHtml('cometa'));
      scope.randomValuesFor(cometa);
      return $(cometa).animate({
        'left': '-=100',
        'top': '+=200',
        'opacity': '0'
      }, 1000, function() {
        return $(this).remove();
      });
    }, 5000);
  };

  return SiteCanvasContainer;

})();

siteCanvasContainer = new SiteCanvasContainer;

siteCanvasContainer.createStars();

siteCanvasContainer.animateStars();

siteCanvasContainer.animateAstro();

var EmailFormController, mailSender;

EmailFormController = (function() {
  function EmailFormController() {}

  EmailFormController.prototype.sendEmail = function() {
    return $('body').on('submit', '[role="ContactForm"]', function(event) {
      event.preventDefault();
      return $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: $(this).serialize(),
        success: function(response) {
          return $('.emailErrorsContainer').html(response);
        }
      });
    });
  };

  return EmailFormController;

})();

mailSender = new EmailFormController;

mailSender.sendEmail();

var HOST;

HOST = window.location.host;

var routeConfig;

routeConfig = function($routeProvider) {
  return $routeProvider.when('/home', {
    controller: 'ContentController',
    controllerAs: 'vm',
    templateUrl: "/home"
  }).when('/work', {
    controller: 'ContentController',
    controllerAs: 'vm',
    templateUrl: "/work"
  }).when('/about', {
    controller: 'ContentController',
    controllerAs: 'vm',
    templateUrl: "/about"
  }).when('/work-article/:articleId', {
    controller: 'WorkArticleController',
    controllerAs: 'vm',
    templateUrl: function(params) {
      return "/work-article/" + params.articleId;
    }
  }).when('/profile/:profileId', {
    controller: 'AboutProfileController',
    controllerAs: 'vm',
    templateUrl: function(params) {
      return "/profile/" + params.profileId;
    }
  }).otherwise({
    redirectTo: '/home'
  });
};

var NavBarController;

NavBarController = (function() {
  function NavBarController($location, $window, $rootScope) {
    var vm;
    vm = this;
    $rootScope.place = function(ruta) {
      return $location.path().indexOf(ruta) === 0 || $location.path() === ruta;
    };
    $rootScope.backButton = function() {
      if ($location.path().indexOf('/work') === 0) {
        return "./#/work";
      } else if ($location.path().indexOf('/about') === 0) {
        return "./#/about";
      }
    };
  }

  return NavBarController;

})();

var ContentController;

ContentController = function($http) {
  var vm;
  vm = this;
  return vm.prueba = 'esta es una prueba';
};

var WorkArticleController;

WorkArticleController = (function() {
  function WorkArticleController($location, $window, $rootScope) {
    var vm;
    vm = this;
    vm.workArticle = true;
    vm.aboutArticle = false;
    vm.sectionType = 'workArticle';
  }

  return WorkArticleController;

})();

var AboutProfileController;

AboutProfileController = (function() {
  function AboutProfileController() {
    var vm;
    vm = this;
    vm.workArticle = false;
    vm.aboutArticle = true;
    vm.sectionType = 'userProfile';
  }

  return AboutProfileController;

})();

angular.module('SiteInfoApp', ['ngRoute']).config(['$routeProvider', routeConfig]).controller(['$http', ContentController]).controller(['$http', WorkArticleController]).controller(['$location', '$rootScope', NavBarController]);
