'use strict';

class bcdClock.Views.DotsView extends Backbone.View
    template: JST['app/scripts/templates/dots.hbs']
    id: 'dots'
    className: 'layout'

    initialize: ->
        @model = new bcdClock.Models.TimeModel
        setInterval @model.currentTime, 1000
        @listenTo @model, 'change', @update

    render: ->
        @$el.html @template( @model.attributes )
        # setTimeout @update, 1000
        @el

    update: =>
        attrs   = @model.attributes.time
        $blocks = @$('.block')
        @$('.active').removeClass('active')

        $.each attrs, (i, groups) =>
            $block = $blocks.eq(i)

            $.each groups, (n, digits) ->
                $col = $block.find('li').eq(n)

                $.each digits, (i2, d) ->
                    $mark = $col.find('span')
                                .eq(i2)
                                .not('.disabled')

                    if +d == 1
                        $mark.addClass('active')
