(function() {
  var GHPAGE, body, root;
  body = Template44(function($$) {
    return $$('h1', {}, function() {
      return $$.txt("Hello World!");
    });
  });
  GHPAGE = {};
  GHPAGE.body = body;
  root = window || exports;
  root.GHPAGE = new GHPage();
}).call(this);
