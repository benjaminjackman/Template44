(function() {
  var $$$, GHPAGE, body, docs, editBox, root;
  $$$ = Template44;
  body = $$$(function($$) {
    return $$('div#Content', {}, function() {
      $$('h1', "Template44 - a CoffeeScript Templating Library");
      return $$(docs);
    });
  });
  editBox = $$$(function($$) {
    return $$('textarea#EntryBox');
  });
  docs = $$$(function($$) {
    $$('h1#Description', 'Template44 Documentation');
    $$(docs.description);
    $$('h2#Features', 'Features');
    $$(docs.features);
    return $$('h2#CallsAndMethods', '$$ Calls and Methods');
  });
  docs.description = $$$(function($$) {
    $$.txt('Template44 aims to make writing HTML code in CoffeScript a lot easier.\nFor better or worse, a lot of coders will embed html within herestrings \n(the multi-line strings that the language provides). \nWhile nice for getting things off the ground, html is pretty verbose, having\nto write every tag twice, and it has no support for factoring out common patterns\nwith shorter forms. ');
    $$('p');
    $$.txt('Enter Template44');
    $$('p');
    return $$('a', {
      href: 'http://benjaminjackman.github.com/Template44'
    }, 'Project Page');
  });
  docs.features = $$$(function($$) {
    return $$.txt("TODO RESUME HERE");
  });
  GHPAGE = {};
  GHPAGE.body = body;
  root = window || exports;
  root.GHPAGE = GHPAGE;
}).call(this);
