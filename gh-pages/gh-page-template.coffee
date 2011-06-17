###
#Helper for importing when we are in node land
#Begin Node / Browser Require Code
###
$ = if exports? then require('jquery') else $
_ = if exports? then require('underscore') else _

#Notice here that I am setting $$$ equal to Template44
#This is done solely to save keystrokes
$$$ = if exports? then require('../template44.coffee').Template44 else Template44

html = $$$ ($$) ->
  $$ 'html', ->
    $$ 'head', ->
      $$ 'title', 'Template44'
      $$ 'script', {src : 'js/lib/jquery-1.6.1.min.js'}
      $$ 'script', {src : 'js/lib/underscore.js'}
      $$ 'script', {src : 'https://raw.github.com/benjaminjackman/Template44/master/lib/coffee/1.1.1/extras/coffee-script.js'}
      $$ 'script', {src : 'https://raw.github.com/benjaminjackman/Template44/master/template44.js'}
#      $$ 'script', {src : 'https://raw.github.com/benjaminjackman/Template44/master/gh-page/gh-page-template.js'}
      $$ 'link', {rel : 'stylesheet', 'type' : 'text/css', href : 'css/main.css'}
      $$ 'link', {rel : 'shortcut icon', href : 'images/favicon.ico'}
    $$ 'body', ->
      $$ body
      
body = $$$ ($$) ->
  $$ 'div#Content', {}, ->
    $$ 'h1', {}, 'Template44 - A CoffeeScript Templating Library'
    $$ docs
  
editBox = $$$ ($$) ->
  $$ 'textarea#EntryBox'
  
docs = $$$ ($$) ->
  $$ 'h2#Description', 'Template44 Documentation'
  $$ docs.description
  $$ 'h3#MyFirstTemplate', 'My First Template'
  $$ docs.myFirstTemplate
  $$ 'h3#CallsAndMethods', '$$ Calls and Methods'
  $$ docs.callsAndMethods
  
docs.description = $$$ ($$) ->
  $$ '', '''
    Template44 aims to make writing HTML code in CoffeScript a lot easier.
    For better or worse, a lot of coders will embed html within herestrings 
    (the multi-line strings that the language provides). 
    While nice for getting things off the ground, html is pretty verbose, having
    to write every tag twice, and it has no support for factoring out common patterns
    with shorter forms. 
    '''
  $$ 'p'
  $$ '', 'Enter Template44'
  $$ 'p'
  $$ 'a', {href : 'https://github.com/benjaminjackman/Template44'}, 'Project Page on GitHub'
  
  
docs.myFirstTemplate = $$$ ($$) ->
  $$ '', '''
    Template44 elements can quickly be given ids with #some-id, 
    or classes with .some-css-class.
    '''
  $$ 'p'
  $$ 'pre.coffeecode', 
    '''
    #A Very Simple Hello World Template
    myFirstTemplate = Template44 ($$) ->
      $$ 'div#Hello.red', {}, ->
        $$ '', "Hello World!"
    '''
  $$ 'p'    
  $$ '', "When this is run:"
  $$ 'p'  
  $$ 'pre.coffeecode', 'myFirstTemplate()'
  $$ 'p'  
  $$ '', "Will Produce: "
  $$ 'p'  
  $$ 'pre.htmlcode', '''
  <div id="Hello" class="red">
    Hello World!
  </div>
  '''
  
docs.callsAndMethods = $$$ ($$) ->
  $$ '', 'In this section $$ is shorthand for the name of the parameter in the function passed to Template44 ('
  $$ 'code', 'myTemplate = Template44 ($$) -> ...'
  $$ '', ')'
  $$ 'p'
  $$ 'h4', 'Calls:'
  $$ 'p'
  

#Exporting    
GHPAGE = {}
GHPAGE.html = html
GHPAGE.body = body
root = exports ? window
root.GHPAGE = GHPAGE
