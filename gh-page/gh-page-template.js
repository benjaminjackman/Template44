(function() {
  var GHPAGE, body;
  body = Template44(function($$) {
    return $$('h1', {}, function() {
      return $$.txt("Hello World!");
    });
  });
  GHPAGE = {};
  GHPAGE.body = body;
  root.GHPAGE = new GHPage();
}).call(this);
