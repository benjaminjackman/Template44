###
Template44 - a Coffeescript Templating Library
Version: Alpha
Copyright Ben Jackman 2011
This work is in the Public Domain

currently requires:
underscore.js (though that's easy enough to remove)
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

  addText : (text) -> @currentNode.children.push({"type":"text", value:text})

  addJQuery : (elem) -> @currentNode.children.push({"type":"jQuery", value:elem})
  
  addElems : (elems) ->
    doPush = (elem) => @currentNode.children.push({"type":"elem", value: elem})
    if (_.isArray[elems])
      _(elems).each (elem) -> doPush(elem)
    else
      doPush(elems)
      

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
  else if (node.type == "elem")
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
    else if (_.isArray(el))
      _(el).chain().flatten().each (cel) -> parentElement.appendChild(cel)
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
    if _.isString(args[0]) and args[0] isnt ''
      #Standard string case
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
          stack.addText(r)
      else if (_.isString(body))
        stack.addText(body)
      stack.pop()
      null
    else if _.isString(args[0]) and args[0] is '' and args.length is 2
      stack.addText(args[1])
    else if _.isFunction(args[0])
      #in this case assume this is nested template44
      #since it was not 'applied' we need to pass in the context and options
      #used by the parent then get the node(s) produced and append it/them
      stack.addElems(args[0](context, options))
      null
    else
      #in this case we are going to assume that we have
      #an applied nested template44 that we are going to need to insert
      #in this case the result should just be directly appendable at this location
      stack.addElems(args[0])
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
    
  # Returns either an array or a single element
  ret = (context, options) ->
    root = build(context, options).rootElems()
    l = root.length
    if l == 1
      render(root[0])
    else if l == 0
      null
    else
    _(build(context, options).rootElems()).map((x)-> render(x))      

  # A way to ensure, with an exception, that only one element is returned
  ret.element = (context, options) ->
    root = build(context, options).rootElems()
    l = root.length
    if l == 1
      render(root[0])
    else if l == 0
      null
    else
      throw "Please use .array(context) Instead, as there was > 1 elements"

  # Always returns an array of elements, even if there is only 1
  ret.array = (context, options) ->
    _(build(context, options).rootElems()).map((x)-> render(x))

  # Helper that returns the stack without it being rendered
  ret.stack = (context, options) ->
    build(context, options).rootElems()

  ret

root = window or exports

root.Template44 = Template44

