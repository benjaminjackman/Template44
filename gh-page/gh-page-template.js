(function() {
  var $$$, GHPAGE, body, docs, editBox, html, marginStrip, root;
  $$$ = typeof exports !== "undefined" && exports !== null ? require() : Template44;
  marginStrip = function(txt) {};
  html = $$$(function($$) {
    return $$('html', function() {
      $$('head', function() {
        $$('title', 'Template44');
        $$('script', {
          src: 'js/lib/jquery-1.6.1.min.js'
        });
        $$('script', {
          src: 'js/lib/underscore.js'
        });
        $$('script', {
          src: 'https://raw.github.com/benjaminjackman/Template44/master/lib/coffee/1.1.1/extras/coffee-script.js'
        });
        $$('script', {
          src: 'https://raw.github.com/benjaminjackman/Template44/master/template44.js'
        });
        $$('link', {
          rel: 'stylesheet',
          'type': 'text/css',
          href: 'css/main.css'
        });
        return $$('link', {
          rel: 'shortcut icon',
          href: 'images/favicon.ico'
        });
      });
      return $$('body', function() {
        return $$(body);
      });
    });
  });
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
    $$('pre.coffeecode', '#A Very Simple Hello World Template\nmyFirstTemplate = Template44 ($$) ->\n  $$ \'div#Hello.red\', {}, ->\n    $$ \'\', "Hello World!"');
    $$('p');
    $$('', "When this is run:");
    $$('p');
    $$('pre.coffeecode', 'myFirstTemplate()');
    $$('p');
    $$('', "Will Produce: ");
    $$('p');
    return $$('pre.htmlcode', '<div id="Hello" class="red">\n  Hello World!\n</div>');
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
  GHPAGE.html = html;
  GHPAGE.body = body;
  root = window || exports;
  root.GHPAGE = GHPAGE;
}).call(this);
