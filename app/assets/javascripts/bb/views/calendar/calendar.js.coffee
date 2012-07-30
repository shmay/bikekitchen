App.Views.Calendar = Backbone.View.extend
  id:'calendar'
  #className:''
  tagName:'table'
  template: JST["bb/tmpl/calendar"]

  render: ->
    @$el.html @template()

    this
