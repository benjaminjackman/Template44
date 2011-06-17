


body = Template44 ($$) ->
  $$ 'h1', {}, () ->
    $$.txt "Hello World!"
  
    
GHPAGE = {}
GHPAGE.body = body

root.GHPAGE = new GHPage()
