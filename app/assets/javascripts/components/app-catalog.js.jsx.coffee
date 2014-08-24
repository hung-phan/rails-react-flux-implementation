###* @jsx React.DOM ###
define [
  "react-with-addons"
  "stores/app-store"
  "components/add-to-cart"
], (React, AppStore, AddToCart) ->
  "use strict"

  AppCatalog = React.createClass(
    getInitialState: ->
      items: AppStore.getCatalog()

    render: ->
      items = _(@state.items).map((catalogItem)->
        return (
          `<tr key={catalogItem.id}>
            <td>{catalogItem.name}</td>
            <td>$ {catalogItem.cost}</td>
            <td><AddToCart item={catalogItem} /></td>
          </tr>`
        )
      )

      `<table className="table table-stripped">
        <thead>
          <tr>
            <th>Name</th>
            <th>Cost</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {items}
        </tbody>
      </table>`
  )

  AppCatalog
