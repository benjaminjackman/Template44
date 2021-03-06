(function() {
  /*
  Template44 - a Coffeescript Templating Library
  Version: Alpha
  Copyright Ben Jackman 2011
  Released under the MIT License
  currently requires:
  underscore.js (though that can/will be removed in the future)
  */  var $, DomDocumentNodeBuilder, TStack, Template44, createRecorder, explodeAttrs, explodeTag, parseTag, render, root, _;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __slice = Array.prototype.slice;
  $ = typeof exports !== "undefined" && exports !== null ? require('jquery') : $;
  _ = typeof exports !== "undefined" && exports !== null ? require('underscore') : _;
  TStack = (function() {
    function TStack() {
      this.currentNode = {
        tag: null,
        parent: null,
        attrs: null,
        children: []
      };
    }
    TStack.prototype.push = function(tag, attrs) {
      var old;
      old = this.currentNode;
      this.currentNode = {
        type: "node",
        tag: tag,
        attrs: attrs,
        parent: old,
        children: []
      };
      return old.children.push(this.currentNode);
    };
    TStack.prototype.addText = function(text) {
      return this.currentNode.children.push({
        "type": "text",
        value: text
      });
    };
    TStack.prototype.addJQuery = function(elem) {
      return this.currentNode.children.push({
        "type": "jQuery",
        value: elem
      });
    };
    TStack.prototype.addElems = function(elems) {
      var doPush;
      doPush = __bind(function(elem) {
        return this.currentNode.children.push({
          "type": "elem",
          value: elem
        });
      }, this);
      if (_.isArray[elems]) {
        return _(elems).each(function(elem) {
          return doPush(elem);
        });
      } else {
        return doPush(elems);
      }
    };
    TStack.prototype.pop = function() {
      return this.currentNode = this.currentNode.parent;
    };
    TStack.prototype.rootElems = function() {
      var cur;
      cur = this.currentNode;
      while (cur.parent !== null) {
        cur = cur.parent;
      }
      return cur.children;
    };
    return TStack;
  })();
  DomDocumentNodeBuilder = {
    createTextNode: function(text) {
      return document.createTextNode(text);
    },
    createElement: function(tag) {
      return document.createTextNode(tag);
    }
  };
  render = function(node, parentElement, nodeBuilder) {
    var c, el, k, v, _i, _len, _ref, _ref2;
    if (nodeBuilder == null) {
      nodeBuilder = DomDocumentNodeBuilder;
    }
    el = null;
    if (node.type === "text") {
      el = nodeBuilder.createTextNode(node.value);
    } else if (node.type === "jQuery") {
      el = node.value;
    } else if (node.type === "elem") {
      el = node.value;
    } else if (node.type === "node") {
      el = nodeBuilder.createElement(node.tag);
      _ref = node.attrs;
      for (k in _ref) {
        v = _ref[k];
        el.setAttribute(k, v);
      }
      _ref2 = node.children;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        c = _ref2[_i];
        render(c, el, nodeBuilder);
      }
    }
    if (parentElement != null) {
      if (node.type === "jQuery") {
        el.appendTo(parentElement);
      } else if (_.isArray(el)) {
        _(el).chain().flatten().each(function(cel) {
          return parentElement.appendChild(cel);
        });
      } else {
        parentElement.appendChild(el);
      }
    }
    return el;
  };
  parseTag = function(tag) {
    var cls, id, t, _ref, _ref2;
    t = /^([^\.#]*)/g.exec(tag)[1];
    id = (_ref = /#([^\.#]*)/g.exec(tag)) != null ? _ref[1] : void 0;
    cls = (_ref2 = /\.([^\.#]*)/g.exec(tag)) != null ? _ref2[1] : void 0;
    return {
      tag: t,
      id: id,
      cls: cls
    };
  };
  explodeTag = function(tag) {
    var t;
    if (_.isFunction(tag)) {
      t = tag();
      if (_.isString(t)) {
        return parseTag(t);
      } else {
        return null;
      }
    } else if (_.isString(tag)) {
      return parseTag(tag);
    } else {
      return null;
    }
  };
  explodeAttrs = function(attrs) {
    if (_.isFunction(attrs)) {
      return attrs();
    } else {
      return attrs;
    }
  };
  createRecorder = function(stack, options, context) {
    var jQueryFn, recorder, recorderFn, txtFn;
    recorderFn = function() {
      var args, attrs, body, getAttrs, r, tag, _ref;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (_.isString(args[0]) && args[0] !== '') {
        tag = explodeTag(args[0]);
        getAttrs = function(attrObj) {
          return _.extend({}, explodeAttrs(attrObj));
        };
        _ref = args.length === 2 ? _.isFunction(args[1]) || _.isString(args[1]) ? {
          attrs: getAttrs({}),
          body: args[1]
        } : {
          attrs: getAttrs(args[1])
        } : args.length > 2 ? {
          attrs: getAttrs(args[1]),
          body: args[2]
        } : {
          attrs: getAttrs({})
        }, attrs = _ref.attrs, body = _ref.body;
        if (tag.cls != null) {
          attrs["class"] = tag.cls;
        }
        if (tag.id != null) {
          attrs.id = tag.id;
        }
        stack.push(tag.tag, attrs);
        if (_.isFunction(body)) {
          r = body.apply(context);
          if (_.isString(r)) {
            stack.addText(r);
          }
        } else if (_.isString(body)) {
          stack.addText(body);
        }
        stack.pop();
        return null;
      } else if (_.isString(args[0]) && args[0] === '' && args.length === 2) {
        return stack.addText(args[1]);
      } else if (_.isFunction(args[0])) {
        stack.addElems(args[0](context, options));
        return null;
      } else {
        stack.addElems(args[0]);
        return null;
      }
    };
    recorder = _.bind(recorderFn, context);
    txtFn = function(s) {
      return stack.pushText(s);
    };
    jQueryFn = function(e) {
      return stack.pushJQuery(e);
    };
    recorder.txt = _.bind(txtFn, context);
    recorder.jQuery = _.bind(jQueryFn, context);
    recorder.$ = recorder.jQuery;
    return recorder;
  };
  Template44 = function(templateBuilder) {
    var build, renderWrap, ret;
    build = function(context, options) {
      var r, stack;
      stack = new TStack();
      r = createRecorder(stack, options, context);
      templateBuilder.apply(context, [r]);
      return stack;
    };
    renderWrap = function(root, options) {
      if ((options != null ? options.document : void 0) != null) {
        return render(root, null, options.document);
      } else {
        return render(root);
      }
    };
    ret = function(context, options) {
      var l, root;
      root = build(context, options).rootElems();
      l = root.length;
      if (l === 1) {
        renderWrap(root[0], options);
      } else if (l === 0) {
        null;
      } else {

      }
      return _(build(context, options).rootElems()).map(function(x) {
        return renderWrap(x, options);
      });
    };
    ret.element = function(context, options) {
      var l, root;
      root = build(context, options).rootElems();
      l = root.length;
      if (l === 1) {
        return renderWrap(root[0], options);
      } else if (l === 0) {
        return null;
      } else {
        throw "Please use .array(context) Instead, as there was > 1 elements";
      }
    };
    ret.array = function(context, options) {
      return _(build(context, options).rootElems()).map(function(x) {
        return renderWrap(x, options);
      });
    };
    ret.stack = function(context, options) {
      return build(context, options).rootElems();
    };
    return ret;
  };
  root = typeof exports !== "undefined" && exports !== null ? exports : window;
  root.Template44 = Template44;
}).call(this);
