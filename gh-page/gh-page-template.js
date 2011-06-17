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
    $$('', 'Template44 aims to make writing HTML code in CoffeScript a lot easier.\nFor better or worse, a lot of coders will embed html within herestrings \n(the multi-line strings that the language provides). \nWhile nice for getting things off the ground, html is pretty verbose, having\nto write every tag twice, and it has no support for factoring out common patterns\nwith shorter forms. ');
    $$('p');
    $$('', 'Enter Template44');
    $$('p');
    return $$('a', {
      href: 'https://github.com/benjaminjackman/Template44'
    }, 'Project Page on GitHub');
  });
  docs.myFirstTemplate = $$$(function($$) {
    $$('', 'Template44 elements can quickly be given ids with #some-id, \nor classes with .some-css-class.');
    $$('p');
    $$('pre', '#A Very simple Hello World Template\n#will create a method helloTemplate\nmyFirstTemplate = Template44 ($$) ->\n  $$ \'div#Hello.red\', {}, ->\n    $$ \'\', "Hello World!"');
    $$('p');
    $$('', "When this is run:");
    $$('p');
    $$('pre', 'myFirstTemplate()');
    $$('p');
    $$('', "Will Produce: ");
    $$('p');
    return $$('pre', '<div id="Hello" class="red">\n  Hello World!\n</div>');
  });
  docs.callsAndMethods = $$$(function($$) {
    $$('', 'In this section $$ is shorthand for the name of the parameter in the function passed to Template44 (');
    $$('code', 'myTemplate = Template44 ($$) -> ...');
    $$('', ')');
    $$('p');
    $$('h4', 'Calls:');
    return $$('p');
  });
  GHPAGE = {};
  GHPAGE.body = body;
  root = window || exports;
  root.GHPAGE = GHPAGE;
}).call(this);
