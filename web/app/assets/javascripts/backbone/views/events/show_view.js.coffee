Web.Views.Events ||= {}

class Web.Views.Events.ShowView extends Backbone.View
  template: JST["backbone/templates/events/show"]

  events:
    "click a.hide-event": "hide"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

  hide: ->
    @trigger "show_event:hide"
