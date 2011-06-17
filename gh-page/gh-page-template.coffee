

body = Template44 ($$) ->
  $$ 'h1', {}, () ->
    $$.txt "Hello World!"
    $$ 'p'
    $$ editBox
    $$ 'p'
    $$ 'div#RenderArea'
  
editBox = Template44 ($$) ->
  $$ 'textarea#EntryBox'

#Exporting    
GHPAGE = {}
GHPAGE.body = body
root = window or exports
root.GHPAGE = GHPAGE
