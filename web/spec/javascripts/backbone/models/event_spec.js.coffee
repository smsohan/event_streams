describe "EventsCollection", ->

  describe '#filter', =>
    it 'should fetch data from server filtered by query', =>
      events = new Web.Collections.EventsCollection()
      spyOn(events, 'fetch')

      events.filter("canada")

      expect(events.fetch).toHaveBeenCalledWith({data: {query: "canada"}})


    it 'should set the header when filtered by query', =>
      events = new Web.Collections.EventsCollection()
      events.filter("canada")
      expect(events.header).toEqual('Events matching canada')

    it 'should set the header when all events are selected', =>
      events = new Web.Collections.EventsCollection()
      events.filter("all")
      expect(events.header).toEqual('All events')
