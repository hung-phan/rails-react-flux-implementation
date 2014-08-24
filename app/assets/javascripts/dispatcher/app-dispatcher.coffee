define [
  "jquery"
  "dispatcher/dispatcher"
], ($, Dispatcher)->
  "use strict"

  AppDispatcher = $.extend(Dispatcher.prototype, {
    handleViewAction: (action)->
      @dispatch(
        source: 'VIEW_ACTION'
        action: action
      )
  })

  AppDispatcher
