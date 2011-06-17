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

class TStack
  constructor : () ->
    @currentNode = {
      tag : null
      parent : null
      attrs : null
      children : []
    }

  push : (tag, attrs) ->
    old = @currentNode
    @currentNode = {
      type: "node"
      tag : tag
      attrs : attrs
      parent : old
      children : []
    }
    old.children.push(@currentNode)

  pushText : (text) -> @currentNode.children.push({"type":"text", value:text})

  pushJQuery : (elem) -> @currentNode.children.push({"type":"jQuery", value:elem})

  pop : () -> @currentNode = @currentNode.parent

  rootElems : () ->
    cur = @currentNode
    while (cur.parent != null)
      cur = cur.parent
    cur.children

render = (node, parentElement) ->
  el = null
  if (node.type == "text")
    el = document.createTextNode(node.value)
  else if (node.type == "jQuery")
    el = node.value
  else if (node.type == "node")
    el = document.createElement(node.tag)
    for k, v of node.attrs
      el.setAttribute k, v
    for c in node.children
      render c, el
  if parentElement?
    if (node.type == "jQuery")
      el.appendTo(parentElement)
    else
      parentElement.appendChild(el)

  el

parseTag = (tag) ->
  t = /^([^\.#]*)/g.exec(tag)[1]
  id = /#([^\.#]*)/g.exec(tag)?[1]
  cls = /\.([^\.#]*)/g.exec(tag)?[1]
  #TODO pseudocode
  #repeat the match for class and string.replace(res[0], "") while res[0] != null or undefined
  {tag:t,id:id,cls:cls}


explodeTag = (tag) ->
  if (_.isFunction(tag))
    t = tag()
    if (_.isString(t))
      parseTag(t)
    else
      null
  else if (_.isString(tag))
    parseTag(tag)
  else
    null

explodeAttrs = (attrs) ->
  if (_.isFunction(attrs))
    attrs()
  else
    attrs

createRecorder = (stack, options, context) ->

  #The actual recorder, from the users view
  #this is the $$ in the call
  # Template44 ($$) ->
  #todo make attrs optional
  recorderFn = (args...) ->
    tag = explodeTag(args[0])
    getAttrs = (attrObj) -> _.extend({}, explodeAttrs(attrObj))
    {attrs,body} =
      if args.length == 2
        if (_.isFunction(args[1]) or _.isString(args[1]))
          {attrs:getAttrs({}),body:args[1]}
        else
          {attrs:getAttrs(args[1])}
      else if args.length > 2
        {attrs:getAttrs(args[1]),body:args[2]}
      else
        {attrs:getAttrs({})}
    if tag.cls? then attrs["class"] = tag.cls
    if tag.id? then attrs.id = tag.id 
    stack.push(tag.tag, attrs)

    if (_.isFunction(body))
      r = body.apply(context)
      if (_.isString(r))
        stack.pushText(r)
    else if (_.isString(body))
      stack.pushText(body)
    
    stack.pop()
    null

  #recorder.raw = (s) -> stack.pushText(s)
  recorder = _.bind(recorderFn, context)
  txtFn = (s) -> stack.pushText(s)
  jQueryFn = (e) -> stack.pushJQuery(e)
  recorder.txt = _.bind(txtFn, context)
  recorder.jQuery = _.bind(jQueryFn, context)
  recorder.$ = recorder.jQuery
  recorder

Template44 = (templateBuilder) ->
  build = (context, options) ->
    stack = new TStack()
    r = createRecorder(stack, options, context)
    templateBuilder.apply(context, [r])
    stack

  ret = (context, options) ->
    root = build(context, options).rootElems()
    l = root.length
    if l == 1
      render(root[0])
    else if l == 0
      null
    else
      throw "Please use .array(context) Instead, as there was > 1 elements"

  ret.array = (context, options) ->
    _(build(context, options).rootElems()).map((x)-> render(x))

  ret.stack = (context, options) ->
    build(context, options).rootElems()

  ret

window.Template44 = Template44

Cogent.addGlobal "Template44", Template44
