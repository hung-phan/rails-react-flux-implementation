###* @jsx React.DOM ###
define [
  "react-with-addons"
  "actions/app-actions"
], (React, AppActions) ->
  "use strict"

  addToCart = React.createClass(
    handleClick: (e) ->
      AppActions.addItem @props.item

    render: ->
      `<button onClick={this.handleClick}>Add To Cart</button>`
  )

  addToCart
