


body = Template44 ($$) ->
  $$ 'h1', {}, () ->
    $$.txt "Hello World!"
  

#Exporting    
GHPAGE = {}
GHPAGE.body = body
root = window or exports
root.GHPAGE = new GHPage()
