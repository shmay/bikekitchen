#= require_self
#= require_tree ./models
#= require_tree ./routers
#= require_tree ./tmpl
#= require_tree ./views

window.App =
  Models: {}
  Lists: {}
  Views: {}

App.start = ->
  App.router = new App.Router()
  Backbone.history.start(pushState:true)

$ ->
  App.start()

v = {}
_.extend(v, Backbone.Events)
App.vent = v
