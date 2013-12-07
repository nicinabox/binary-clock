'use strict';

class bcdClock.Views.AppView extends Backbone.View
    template: JST['app/scripts/templates/app.hbs']
    el: '#root'
    viewingRatio: 4 / 6

    initialize: ->
        @dotsView = new bcdClock.Views.DotsView
        @barsView = new bcdClock.Views.BarsView

        @setHeight()
        $(window).resize @setHeight

        @setColorForTime()
        @listenTo @dotsView.model, 'change:time_of_day', @setColorForTime

    render: ->
        @$el.html @template()

        @standardTimeView()

        @$('.swipe-wrap').append @dotsView.render()
        @$('.swipe-wrap').append @barsView.render()

        bullets = document.getElementById('position')
                          .getElementsByTagName('a')

        @swipe = Swipe document.getElementById('slider'),
            callback: (pos) ->
              i = bullets.length
              while (i--)
                bullets[i].className = ''
              bullets[pos].className = 'active'

    setHeight: =>
        @$el.height ($(window).width() * @viewingRatio)

    setColorForTime: ->
        className = @dotsView.model.get('time_of_day')
        unless $('body').hasClass(className)
            $('body').attr('class', '')
                     .addClass(className)

    standardTimeView: ->
        @standardTimeView = new bcdClock.Views.StandardTimeView
            model: @dotsView.model
        @standardTimeView.render()
