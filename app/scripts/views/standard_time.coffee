'use strict';

class bcdClock.Views.StandardTimeView extends Backbone.View
    template: JST['app/scripts/templates/standard_time.hbs']
    id: 'standard-time'

    initialize: ->
        @listenTo @model, 'change', @render

    render: ->
        @$el.html @template( @model.attributes )
        @el
