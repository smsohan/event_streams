Web.Views.Events ||= {}

class Web.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]

  initialize: () ->
    @options.events.bind('reset', @addAll)

  addAll: () =>
    @$('#header').html(@options.events.header)

    @$('tbody').empty()
    @options.events.each(@addOne)

  addOne: (event) =>
    view = new Web.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(events: @options.events.toJSON(), header: @options.events.header ))
    @addAll()

    return this
