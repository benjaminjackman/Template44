###
Template44 - a coffeescript templating library
Copyright Ben Jackman 2011
This work is in the Public Domain
currently requires underscore.js (though that's easy enough to remove)

example usages, in coffeescript:

template = Template44 ($$) ->
  $$ 'div.indicator-sel', {value : @a}, ->
    $$ 'h1#the-h1.red', {}, () -> 'hello world'
    $$.txt "this is some text"
    $$ 'br', {}, () -> ""
    $$ 'p', {}, () -> "hi mom i'm " + @b

console.log(template({a : 5, b : "SO AWESOME"}),)
>
  <div value="5" class="indicator-sel">
    <h1 class="red" id="the-h1">hello world</h1>
    "this is some text"
    <br>
    <p>hi mom i'm SO AWESOME</p>
  </div>

bodyTempl = Template44 ($$) ->
  $$ 'body', {}, () ->
    $$ 'div#main-nav', {}, null
    $$ 'div#content', {}, null
    $$ 'h2.page-header', {}, () ->
      $$.txt "#{@companyName} Unit Tests"

> console.log(bodyTempl({companyName : "Template Co."}),)
  <body>
    <div id="main-nav"></div>
    <div id="content"></div>
    <h2 class="page-header">Template Co. Unit Tests</h2>
  </body>

###