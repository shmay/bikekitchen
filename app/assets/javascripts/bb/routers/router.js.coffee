App.Router = Backbone.Router.extend
  initialize: ->
    new App.Views.Main()
    new App.Views.Navbar()
  routes:
    "accounts/:id" : "show"
  show: (id) -> console.log 'show'
