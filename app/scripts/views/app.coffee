'use strict';

class bcdClock.Views.AppView extends Backbone.View
    template: JST['app/scripts/templates/app.hbs']
    el: '#root'
    viewingRatio: 4 / 6

    initialize: ->
        @dotsView = new bcdClock.Views.DotsView
        @standardTimeView = new bcdClock.Views.StandardTimeView
            model: @dotsView.model

        @setHeight()
        $(window).resize @setHeight

        @listenTo @dotsView.model, 'change', @setTimeOfDay

    render: ->
        @$el.append @standardTimeView.render()
        @$el.append @dotsView.render()

    setHeight: =>
        @$el.height ($(window).width() * @viewingRatio)

    setTimeOfDay: ->
        hour = +moment().format('HH')

        if hour < 5
            className = 'midnight'
        else if hour < 12
            className = 'morning'
        else if hour < 16
            className = 'afternoon'
        else if hour < 20
            className = 'evening'
        else if hour < 23
            className = 'night'
        else
            className = 'midnight'

        unless $('body').hasClass(className)
            $('body').attr('class', '')
                     .addClass(className)
