Template44 - a CoffeeScript Templating Library
==============================================

Template44 aims to make writing HTML code with scripts a lot easier.
In CoffeeScript, for better or worse, a lot of coders will embed html 
within herestrings (the multi-line strings that the language provides). 
While nice for getting things off the ground, html code can be pretty 
verbose and error prone to write, and it has no capability to eliminate 
'copy-pasta' easily.


Features
--------
Template44 elements can quickly be given ids with #id-name, or classes with .cls-name . 
There is no need to close out tags

The following code: 

    #A Very simple Hello World Template
    #will create a method helloTemplate
    helloTemplate = Template44 ($$) ->
      $$ 'div#Hello.red, {}, ->
        $$.txt "Hello World!"

When this code is run:

    helloTemplate()

Will Produce:

    <div id="Hello" class="red">
      Hello World!
    </div>

Templates can have variables defined that can be set when the the template
is used. This allows for a fill in the blanks styles and helps with reuse.



...old...

Examples
--------

#First create a template object, this object will then become a factory
#for making the html that is encoded for it.
# '$$' ends up being fairly readable so I use that, but whatever you 
# use as the argument to the builder method you give Template44 will work.
template = Template44 ($$) ->
  $$ 'div.indicator-sel', {value : @a}, ->
    $$ 'h1#the-h1.red', {}, () -> 'hello world'
    $$.txt "this is some text"
    $$ 'br', {}, () -> ""
    $$ 'p', {}, () -> "hi mom i'm " + @b

console.log(template({a : 5, b : "SO AWESOME"}),)
>
  <div value=​"5" class=​"indicator-sel">​
    <h1 class=​"red" id=​"the-h1">​hello world​</h1>​
    "this is some text"
    <br>​
    <p>​hi mom i'm SO AWESOME​</p>​
  </div>​

bodyTempl = Template44 ($$) ->
  $$ 'body', {}, () ->
    $$ 'div#main-nav', {}, null
    $$ 'div#content', {}, null
    $$ 'h2.page-header', {}, () ->
      $$.txt "#{@companyName} Unit Tests"

console.log(bodyTempl({companyName : "Cogent"}),)
>
  <body>​
    <div id=​"main-nav">​</div>​
    <div id=​"content">​</div>​
    <h2 class=​"page-header">​Cogent Unit Tests​</h2>​
  </body>​
###
