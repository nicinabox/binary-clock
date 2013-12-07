'use strict';

class bcdClock.Views.TimeView extends Backbone.View
    className: 'layout'

    constructor: ->
        super
        @model ||= new bcdClock.Models.TimeModel
        setInterval @model.currentTime, 1000
        @listenTo @model, 'change', @update

    render: ->
        @$el.html @template( @model.attributes )
        @el

    update: =>
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
