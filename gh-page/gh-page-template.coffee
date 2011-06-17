
#Notice here that I am setting $$$ equal to Template44
#This is done solely to save keystrokes

marginStrip = (txt) ->
  

$$$ = Template44

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
  $$.txt '''
    Template44 aims to make writing HTML code in CoffeScript a lot easier.
    For better or worse, a lot of coders will embed html within herestrings 
    (the multi-line strings that the language provides). 
    While nice for getting things off the ground, html is pretty verbose, having
    to write every tag twice, and it has no support for factoring out common patterns
    with shorter forms. 
    '''
  $$ 'p'
  $$.txt 'Enter Template44'
  $$ 'p'
  $$ 'a', {href : 'http://benjaminjackman.github.com/Template44'}, 'Project Page'
  
  
docs.myFirstTemplate = $$$ ($$) ->
  $$.txt '''
    Template44 elements can quickly be given ids with #some-id, 
    or classes with .some-css-class.
    '''
  $$ 'p'
  $$ 'pre', 
    '''
    #A Very simple Hello World Template
    #will create a method helloTemplate
    myFirstTemplate = Template44 ($$) ->
      $$ 'div#Hello.red', {}, ->
        $$.txt "Hello World!"
    '''
  $$ 'p'
  $$.txt "When this is run:"
  $$ 'p'
  $$ 'pre', 'myFirstTemplate'
  $$ 'p'
  $$.txt "Will Produce: "
  $$ 'p'
  $$ 'pre', '''
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
GHPAGE.body = body
root = window or exports
root.GHPAGE = GHPAGE
