class Web.Routers.EventsRouter extends Backbone.Router
  initialize: (options) ->
    @events = new Web.Collections.EventsCollection()
    @events.reset options.events

  routes:
    "new"      : "newEvent"
    "index"    : "index"
    "filter/:q": "filter"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newEvent: ->
    @view = new Web.Views.Events.NewView(collection: @events)
    $("#events").html(@view.render().el)

  index: ->
    @view = new Web.Views.Events.IndexView(events: @events)
    $("#events").html(@view.render().el)

  filter: (q)->
    @events.filter q
    @index()

  show: (id) ->
    event = @events.get(id)

    @view = new Web.Views.Events.ShowView(model: event)
    $("#event-detail").html(@view.render().el)

  edit: (id) ->
    event = @events.get(id)

    @view = new Web.Views.Events.EditView(model: event)
    $("#events").html(@view.render().el)
