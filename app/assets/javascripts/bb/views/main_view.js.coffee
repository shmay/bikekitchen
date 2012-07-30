App.Views.Main = Backbone.View.extend
  el: "#main"
  initialize: ->
    App.vent.on "showCal", @showCal, this

  showCal: ->
    view = new App.Views.Calendar()
    @$el.append view.render().el
