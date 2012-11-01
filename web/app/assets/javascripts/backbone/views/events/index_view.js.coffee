Web.Views.Events ||= {}

class Web.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]

  events:
    "click a.search": 'showSearch'
    'keypress input.search': 'handleEnterKey'

  initialize: () ->
    @options.events.bind('reset', @addAll)

  addAll: () =>
    @$('#header').html(@options.events.header)

    @$('#events-list').empty()
    @options.events.each(@addOne)

  addOne: (event) =>
    view = new Web.Views.Events.EventView({model : event})
    @$('#events-list').append(view.render().el)

  showSearch: =>
    @$('a.search').hide()
    @$('.searchBox').show()

  handleEnterKey: (event)=>
    if event.keyCode == 13
      @options.events.filter(@$('input.search').val())
      return false

  render: =>
    $(@el).html(@template(events: @options.events.toJSON(), header: @options.events.header ))
    @addAll()

    return this
