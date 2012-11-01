Web.Views.Events ||= {}

class Web.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]

  events:
    "click a.search": 'showSearch'
    "click button.search": 'search'
    'keypress input.search': 'handleEnterKey'

  initialize: () ->
    @options.events.bind('reset', @addAll)

  addAll: () =>
    @$('#header').html(@options.events.header)

    @$('tbody').empty()
    @options.events.each(@addOne)

  addOne: (event) =>
    view = new Web.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  showSearch: =>
    @$('a.search').hide()
    @$('.searchBox').show()

  handleEnterKey: (event)=>
    @search() if event.keyCode == 13

  search: =>
    @options.events.filter(@$('input.search').val())

  render: =>
    $(@el).html(@template(events: @options.events.toJSON(), header: @options.events.header ))
    @addAll()

    return this
