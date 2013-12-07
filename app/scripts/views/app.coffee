'use strict';

class bcdClock.Views.AppView extends Backbone.View
    template: JST['app/scripts/templates/app.hbs']
    el: '#root'

    initialize: ->
        @dotsView = new bcdClock.Views.DotsView
        @setHeight()
        $(window).resize @setHeight

    render: ->
        @$el.append @dotsView.render()

    setHeight: =>
        @$el.height $(window).height()
