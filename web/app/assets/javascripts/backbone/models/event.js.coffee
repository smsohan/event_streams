class Web.Models.Event extends Backbone.Model
  paramRoot: 'event'

  defaults:
    title: null
    content: null

class Web.Collections.EventsCollection extends Backbone.Collection
  model: Web.Models.Event
  url: '/events'
  header: 'All events'

  filter: (query)->
    @setHeader(query)
    @fetch({data: {query: query}})

  setHeader: (query)->
  	if query == 'all'
		  @header = 'All events'
  	else
      @header = "Events matching #{query}"



