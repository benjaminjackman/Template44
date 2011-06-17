(function() {
  var GHPAGE, body, editBox, root;
  body = Template44(function($$) {
    return $$('h1', {}, function() {
      $$.txt("Hello World!");
      $$('p');
      $$(editBox);
      $$('p');
      return $$('div#RenderArea');
    });
  });
  editBox = Template44(function($$) {
    return $$('textarea#EntryBox');
  });
  GHPAGE = {};
  GHPAGE.body = body;
  root = window || exports;
  root.GHPAGE = GHPAGE;
}).call(this);
