###* @jsx React.DOM ###
require [
  "jquery"
  "react-with-addons"
  "home/home"
  "director"
  "superagent"
  "lodash"
  "bootstrap"
], ($, React, home) ->
  "use strict"
  $(document).ready ->

    # App Module
    routeDOMElement = document.getElementById("route")

    #doc for routing https://github.com/flatiron/director
    routes =
      "/": ->
        React.renderComponent `<home />`, routeDOMElement
        return

    routerHandler = new Router(routes)
    routerHandler.init "/"
    return

  return
