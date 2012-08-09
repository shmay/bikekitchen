App.Views.Main = Backbone.View.extend
  el: "#main"
  initialize: ->
    App.vent.on "showCal", @showCal, this

  showCal: (events) ->
    view = new App.Views.Calendar(collection:events)
    @$el.append view.render().el
