define [
  "jquery"
  "lodash"
  "es6-promise"
], ($, _)->
  "use strict"

  Promise   = window.Promise
  _callback = []
  _promise  = []

  ###
    Add a promise to queue of callback invocation promises.
    @param {function} callback the Store's register callback.
    @param {object} payload the data for the Action
  ###
  _addPromise = (callback, payload)->
    _promise.push(new Promise((resolve, reject)->
      if callback(payload)
        resolve(payload)
      else
        reject(new Error "Dispatcher callback unsuccessful")
    ))

  _clearPromise = -> _promise.length = 0

  ###
    Dispatcher function
  ###
  class Dispatcher

  $.extend(Dispatcher.prototype, {
    ###
      Register a Store's callback so that it may be invoke by an action.
      @param {function} callback The callback to be registered.
      @return {number} The index of the callback within the _callback array.
    ###
    register: (callback)->
      _callback.push(callback)
      # return index
      _callback.length - 1
    ###
      dispatch
      @param {object} payload the data from Action
    ###
    dispatch: (payload)->
      _.each(_callback, (callback)-> _addPromise(callback, payload))
      Promise.all(_promise).then(_clearPromise)
  })

  Dispatcher
