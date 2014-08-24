###* @jsx React.DOM ###
require [
  "jquery"
  "react-with-addons"
  "components/main-component"
  "director"
  "superagent"
  "lodash"
  "bootstrap"
], ($, React, MainComponent) ->
  "use strict"
  window.React = React

  $(document).ready ->
    # App Module
    routeDOMElement = document.getElementById("route")

    #doc for routing https://github.com/flatiron/director
    routes =
      "/": ->
        React.renderComponent `<MainComponent />`, routeDOMElement
        return

    routerHandler = new Router(routes)
    routerHandler.init "/"
    return

  return
