'use strict';

class bcdClock.Views.AppView extends Backbone.View
    template: JST['app/scripts/templates/app.hbs']
    el: '#root'
    viewingRatio: 4 / 6
    layouts: [
        { _id: 'dots' }
        { _id: 'bars', padding: 6 }
    ]

    events:
        'click #position a': 'goToSlide'

    initialize: ->
        @$el.html @template()

        @standardTimeView = new bcdClock.Views.StandardTimeView
            model: new bcdClock.Models.TimeModel

        @swipeView = new bcdClock.Views.SwipeView
            layouts: @layouts

        @setHeight()
        $(window).resize @setHeight

        @setColorForTime()
        @listenTo @standardTimeView.model, 'change:time_of_day', @setColorForTime

    render: ->
        @standardTimeView.render()
        @$el.prepend @swipeView.render()

    setHeight: =>
        @$el.height ($(window).width() * @viewingRatio)

    setColorForTime: ->
        className = @standardTimeView.model.get('time_of_day')
        unless $('body').hasClass(className)
            $('body').attr('class', '')
                     .addClass(className)

    goToSlide: (e) =>
        e.preventDefault()
        index = $(e.target).index()
        @swipeView.swipe.slide(index)
