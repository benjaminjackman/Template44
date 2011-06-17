
#Notice here that I am setting $$$ equal to Template44
#This is done solely to save keystrokes

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
  $$ 'h3#Features', 'Features'
  $$ docs.features
  $$ 'h3#CallsAndMethods', '$$ Calls and Methods'
  
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
  
  
docs.features = $$$ ($$) ->
  $$.txt """
    TODO RESUME HERE
    """
  

#Exporting    
GHPAGE = {}
GHPAGE.body = body
root = window or exports
root.GHPAGE = GHPAGE
