'use strict';

class bcdClock.Models.TimeModel extends Backbone.Model
    padding: 4
    defauts:
        time: []

    initialize: ->
       @currentTime()

    currentTime: =>
        @set 'time', _.map @now().split(':'), (time_part) =>
            _.map @toBinary(time_part), (digits) ->
                digits.split('')

    now: ->
        moment().format('HH:mm:ss')

    padDigit: (digits) ->
        String("000000" + (+digits)).slice(-@padding)

    toBinary: (number) ->
        _.map number.split(//), (i) =>
            @padDigit((+i).toString(2))
