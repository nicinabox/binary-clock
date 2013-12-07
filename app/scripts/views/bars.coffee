'use strict';

class bcdClock.Views.BarsView extends bcdClock.Views.TimeView
    id: 'bars'

    initialize: ->
        @model = new bcdClock.Models.TimeModel
            padding: 6
