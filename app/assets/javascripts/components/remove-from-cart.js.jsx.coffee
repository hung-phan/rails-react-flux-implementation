###* @jsx React.DOM ###
define [
  "react-with-addons"
  "actions/app-actions"
], (React, AppActions) ->
  "use strict"

  removeFromCart = React.createClass(
    handleClick: (e) ->
      AppActions.removeItem @props.index

    render: ->
      `<button onClick={this.handleClick}>+</button>`
  )

  removeFromCart
