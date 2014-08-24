###* @jsx React.DOM ###
define [
  "react-with-addons"
  "actions/app-actions"
], (React, AppActions) ->
  "use strict"

  increaseItem = React.createClass(
    handleClick: (e) ->
      AppActions.increaseItem @props.index

    render: ->
      `<button onClick={this.handleClick}>+</button>`
  )

  increaseItem
