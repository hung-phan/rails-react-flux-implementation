###* @jsx React.DOM ###
define [
  "react-with-addons"
  "actions/app-actions"
], (React, AppActions) ->
  "use strict"

  decreaseItem = React.createClass(
    handleClick: (e) ->
      AppActions.decreaseItem @props.index

    render: ->
      `<button onClick={this.handleClick}>-</button>`
  )

  decreaseItem

