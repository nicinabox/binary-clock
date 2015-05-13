'use strict';

class bcdClock.Views.TimeView extends Backbone.View
    template: JST['app/scripts/templates/time.hbs']

    initialize: (attrs) ->
        @model = new bcdClock.Models.TimeModel attrs

        setInterval @model.currentTime, 1000
        @listenTo @model, 'change', @updateActive

    render: ->
        @$el.html @template( @model.attributes )
        @el

    updateActive: =>
        parts   = @model.attributes.parts
        $blocks = @$('.block')
        @$('.active').removeClass('active')

        $.each parts, (i, groups) =>
            $block = $blocks.eq(i)

            $.each groups, (n, digits) ->
                $col = $block.find('li').eq(n)

                $.each digits, (i2, d) ->
                    $mark = $col.find('span')
                                .eq(i2)
                                .not('.disabled')

                    if +d == 1
                        $mark.addClass('active')
