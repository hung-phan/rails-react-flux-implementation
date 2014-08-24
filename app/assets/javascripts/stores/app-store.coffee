define [
  "jquery"
  "lodash"
  "dispatcher/app-dispatcher"
  "actions/constants"
  "eventemitter2"
], ($, _, AppDispatcher, Constants, EventEmitter)->
  "use strict"

  CHANGE_EVENT = "change"

  _catalog = [
    {id: 1, name: "Widget #1", cost: 1}
    {id: 2, name: "Widget #2", cost: 2}
    {id: 3, name: "Widget #3", cost: 3}
  ]
  _cartItem = []

  _removeItem = (index)->
    _cartItem[index].inCart = false
    _cartItem.splice(index, 1)

  _increaseItem = (index)->
    _cartItem[index].qty++

  _decreaseItem = (index)->
    if _cartItem[index].qty > 1
      _cartItem[index].qty--
    else
      _removeItem(index)

  _addItem = (item)->
    unless item.inCart
      item.qty = 1
      item.inCart = true
      _cartItem.push item
    else
      index = _.findIndex(_cartItem, (cartItem)-> cartItem.id is item.id)
      _increaseItem(index) if index isnt -1

  AppStore = $.extend(EventEmitter.prototype, {
    emitChange: -> @emit(CHANGE_EVENT)
    addChangeListener: (callback)-> @on(CHANGE_EVENT, callback)
    removeChangeListener: (callback)-> @removeListener(CHANGE_EVENT, callback)
    getCart: -> _cartItem
    getCatalog: -> _catalog
    dispatcherIndex: AppDispatcher.register((payload)->
      action = payload.action

      switch action.actionType
        when Constants.ADD_ITEM then _addItem(action.item)
        when Constants.REMOVE_ITEM then _removeItem(action.index)
        when Constants.INCREASE_ITEM then _increaseItem(action.index)
        when Constants.DECREASE_ITEM then _decreaseItem(action.index)

      AppStore.emitChange()
    )
  })
