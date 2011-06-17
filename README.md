Template44 - a CoffeeScript Templating Library
==============================================

Template44 aims to make writing HTML code in CoffeScript a lot easier.
For better or worse, a lot of coders will embed html within herestrings 
(the multi-line strings that the language provides). 
While nice for getting things off the ground, html is pretty verbose, having
to write every tag twice, and it has no support for factoring out common patterns
with shorter forms. 

Enter Template44

[Project Page](http://benjaminjackman.github.com/Template44)

Features
--------
Template44 elements can quickly be given ids with #some-id, or classes with .some-css-class . 
There is no need to close out tags

The following code: 

    #A Very simple Hello World Template
    #will create a method helloTemplate
    helloTemplate = Template44 ($$) ->
      $$ 'div#Hello.red', {}, ->
        $$.txt "Hello World!"

When this is run:

    helloTemplate()

Will Produce:

    <div id="Hello" class="red">
      Hello World!
    </div>

Templates can have variables defined that can be set when the the template
is used. This allows for a fill in the blanks styles and helps with reuse.


$$ Calls and Methods
--------------------
In this section $$ is shorthand for the name of the parameter in the function passed to Template44
(<code>myTemplate = Template44 ($$) -> ...</code>)


<h3>Calls:<h3>
<h4>$$(String, [Optional Attributes Object], [Optional Nested Call or Text])</h4>

When the first parameter called on $$ is a String  
then Template44 view it as an element tag and if  
you included #ElementName .ClassName(s) then those  
will be inserted as attributes in the element that  
is created.

If you wish to add additional attributes to the element 
that is going to be created you can include an object 
mapping attribute names to attribute values.

If a String is passed as the last parameter to the $$ call it will treated as
text that will be placed in the element with a call to 

If instead you wish to nested

<h4>$$(Function)</h4>

<h4>$$(Object)</h4>






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
