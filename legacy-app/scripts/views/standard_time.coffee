'use strict';

class bcdClock.Views.StandardTimeView extends Backbone.View
    template: JST['app/scripts/templates/standard_time.hbs']
    el: '#standard-time'

    initialize: ->
        setInterval @model.currentTime, 1000
        @listenTo @model, 'change', @render

    render: ->
        @$el.html @template( @model.attributes )
        @el
