jsdom = require('jsdom')
document = jsdom.jsdom "<html><body></body></html>", null, {features: {FetchExternalResources : []}}
$ = require "jquery"
_ = require "underscore"
GHPAGE = require('./gh-page-template.coffee').GHPAGE

console.log($(GHPAGE.html({}, {document : document})).html())
