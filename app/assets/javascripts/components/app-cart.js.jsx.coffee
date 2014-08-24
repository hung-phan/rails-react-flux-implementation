###* @jsx React.DOM ###
define [
  "react-with-addons"
  "stores/app-store"
  "components/remove-from-cart"
  "components/increase-item"
  "components/decrease-item"
], (React, AppStore, RemoveFromCart, IncreaseItem, DecreaseItem) ->
  "use strict"

  AppCart = React.createClass(
    getInitialState: ->
      items: AppStore.getCart()

    _onChange: ->
      @setState(items: AppStore.getCart())

    componentWillMount: ->
      AppStore.addChangeListener(@_onChange)

    render: ->
      total = 0
      items = _(@state.items).map((cartItem, index)->
        subtotal = cartItem.cost * cartItem.qty
        total += subtotal
        return (
          `<tr key={cartItem.id}>
            <td><RemoveFromCart index={index} /></td>
            <td>{cartItem.name}</td>
            <td>{cartItem.qty}</td>
            <td><DecreaseItem index={index} /><IncreaseItem index={index} /></td>
            <td>{subtotal}</td>
          </tr>`
        )
      )

      `<table className="table table-stripped">
        <thead>
          <tr>
            <th></th>
            <th>Name</th>
            <th>Quantity</th>
            <th></th>
            <th>Subtotal</th>
          </tr>
        </thead>
        <tbody>
          {items}
        </tbody>
        <tfoot>
          <tr>
            <td rowSpan="5">Total: {total}</td>
          </tr>
        </tfoot>
      </table>`
  )

  AppCart

