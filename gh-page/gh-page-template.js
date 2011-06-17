(function() {
  var $$$, GHPAGE, body, docs, editBox, marginStrip, root;
  marginStrip = function(txt) {};
  $$$ = Template44;
  body = $$$(function($$) {
    return $$('div#Content', {}, function() {
      $$('h1', {}, 'Template44 - A CoffeeScript Templating Library');
      return $$(docs);
    });
  });
  editBox = $$$(function($$) {
    return $$('textarea#EntryBox');
  });
  docs = $$$(function($$) {
    $$('h2#Description', 'Template44 Documentation');
    $$(docs.description);
    $$('h3#MyFirstTemplate', 'My First Template');
    $$(docs.myFirstTemplate);
    $$('h3#CallsAndMethods', '$$ Calls and Methods');
    return $$(docs.callsAndMethods);
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
  docs.myFirstTemplate = $$$(function($$) {
    $$.txt("Template44 elements can quickly be given ids with #some-id, \nor classes with .some-css-class.");
    $$("p");
    return $$("pre", '#A Very simple Hello World Template\n#will create a method helloTemplate\nhelloTemplate = Template44 ($$) ->\n  $$ \'div#Hello.red\', {}, ->\n    $$.txt "Hello World!"');
  });
  docs.callsAndMethods = $$$(function($$) {});
  GHPAGE = {};
  GHPAGE.body = body;
  root = window || exports;
  root.GHPAGE = GHPAGE;
}).call(this);
