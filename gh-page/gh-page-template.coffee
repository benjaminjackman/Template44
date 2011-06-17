

body = Template44 ($$) ->
  $$ 'div#Content', {}, () ->
    $$ 'h1', "Hello World!"
    $$ 'p'
    $$ editBox
    $$ 'p'
    $$ 'div#RenderArea', "Render Area"
  
editBox = Template44 ($$) ->
  $$ 'textarea#EntryBox'

#Exporting    
GHPAGE = {}
GHPAGE.body = body
root = window or exports
root.GHPAGE = GHPAGE
