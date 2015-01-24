/*
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 1.1
*/

var Responsive;

Responsive = (function() {
  function Responsive() {}

  Responsive.prototype.position = function(option) {
    return $(option.target).each(function() {
      var item;
      item = $(this);
      item.css({
        top: $(option.port).height() - item.height
      });
      return $(window).resize(function() {
        return item.css({
          top: $(option.port).height() - item.height
        });
      });
    });
  };

  Responsive.prototype.background = function() {
    $('#ng-scene').css({
      height: $('img#background').height()
    });
    return $(window).resize(function() {
      return $('#ng-scene').css({
        height: $('img#background').height()
      });
    });
  };

  Responsive.prototype.scene = function() {
    var x;
    x = this;
    return $('img').load(function() {
      switch ($(this).attr('id')) {
        case 'background':
          return x.background();
      }
    });
  };

  return Responsive;

})();
