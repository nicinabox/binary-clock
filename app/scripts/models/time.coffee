'use strict';

class bcdClock.Models.TimeModel extends Backbone.Model
    defaults:
        padding: 4
        time_of_day: ''
        time: ''
        parts: []

    initialize: ->
       @currentTime()

    currentTime: =>
        now = @now()
        @set
            time: now
            time_of_day: @timeOfDay()
            parts: _.map now.split(':'), (time_part) =>
                _.map @toBinary(time_part), (digits) ->
                    digits.split('')

    now: ->
        moment().format('HH:mm:ss')

    padDigit: (digit) ->
        String("000000" + (+digit)).slice(-@get('padding'))

    toBinary: (number) ->
        _.map number.split(//), (i) =>
            @padDigit((+i).toString(2))

    timeOfDay: ->
        hour = moment().format('HH')

        if hour < 5
            className = 'midnight'
        else if hour < 12
            className = 'morning'
        else if hour < 17
            className = 'afternoon'
        else if hour < 20
            className = 'evening'
        else if hour <= 23
            className = 'night'
