Web.Views.Events ||= {}

class Web.Views.Events.EventView extends Backbone.View
  template: JST["backbone/templates/events/event"]

  events:
    "click .destroy" : "destroy"
    "mouseover" : "showControls"
    "mouseleave" : "hideControls"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

  showControls: ->
    @$('.controls').show();

  hideControls: (evt)->
    @$('.controls').hide();
