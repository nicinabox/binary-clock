window.bcdClock =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    @app = new @Views.AppView
    @app.render()

$ ->
  'use strict'
  bcdClock.init();
