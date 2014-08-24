###* @jsx React.DOM ###
define [
  "react-with-addons"
  "components/app-catalog"
  "components/app-cart"
], (React, AppCatalog, AppCart) ->
  "use strict"

  MainComponent = React.createClass(
    render: ->
      `<div className="container-fluid">
        <div className="row">
          <div className="col-xs-12">
            <AppCatalog />
          </div>
          <div className="col-xs-12">
            <AppCart />
          </div>
        </div>
      </div>`
  )

  MainComponent

