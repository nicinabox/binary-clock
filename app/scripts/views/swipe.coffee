'use strict';

class bcdClock.Views.SwipeView extends Backbone.View
    template: JST['app/scripts/templates/swipe.hbs']
    id: 'slider'
    className: 'swipe'

    initialize: (attrs) ->
        _.each attrs.layouts, (layout) ->
            $('<a>', {
                href: "##{layout._id}"
            }).appendTo $('#position')

        @$bullets = $('#position a')
        @$bullets.first().addClass('active')

        @layouts = _.map attrs.layouts, (layout) ->
            new bcdClock.Views.TimeView layout

    render: ->
        @$el.html @template()
        @addLayouts()

        setTimeout =>
            @swipe = Swipe @el,
                callback: (pos) =>
                    @$bullets.removeClass 'active'
                    @$bullets.eq(pos).addClass 'active'
        , 100

        @el

    addLayout: (layout) =>
        @$('.swipe-wrap').append(layout.render())

    addLayouts: ->
        _.each @layouts, @addLayout
