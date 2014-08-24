define [
  "actions/constants"
  "dispatcher/app-dispatcher"
], (Constants, AppDispatcher)->
  "use strict"

  AppActions =
    addItem: (item)->
      AppDispatcher.handleViewAction(actionType: Constants.ADD_ITEM, item: item)
    removeItem: (index)->
      AppDispatcher.handleViewAction(actionType: Constants.REMOVE_ITEM, index: index)
    increaseItem: (index)->
      AppDispatcher.handleViewAction(actionType: Constants.INCREASE_ITEM, index: index)
    decreaseItem: (index)->
      AppDispatcher.handleViewAction(actionType: Constants.DECREASE_ITEM, index: index)

  AppActions
