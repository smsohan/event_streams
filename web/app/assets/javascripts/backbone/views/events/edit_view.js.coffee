Web.Views.Events ||= {}

class Web.Views.Events.EditView extends Backbone.View
  template : JST["backbone/templates/events/edit"]

  events :
    "submit #edit-event" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset('created_at')
    @model.unset('updated_at')

    @model.save(null,
      success : (event) =>
        @model = event
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
