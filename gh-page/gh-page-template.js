(function() {
  var GHPAGE, body, editBox, root;
  body = Template44(function($$) {
    return $$('div#Content', {}, function() {
      $$('h1', "Hello World!");
      $$('p');
      $$(editBox);
      $$('p');
      return $$('div#RenderArea', "Render Area");
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
