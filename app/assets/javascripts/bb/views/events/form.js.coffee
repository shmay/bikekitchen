App.Views.EventForm = Backbone.View.extend
  template: JST["bb/tmpl/events/form"]

  events:
    "submit form" : "submitForm"

  render: ->
    @$el.empty().append @template event: @model.toJSON()

    this

  submitForm: (e) ->
    e.preventDefault()
    attrs = @$('form').serializeObject()
    attrs.day = @options.day
    attrs.month = @options.month
    attrs.js_day_time = new Date 2012, attrs.day, attrs.month

    @model.save attrs,
      success: =>
        @$('#errors').empty().hide()
        @$('#success').show()
        setTimeout( ->
          @$('#success').fadeOut(1000)
        , 1000)
        @collection.add @model
      error: (model,errors) =>
        html = ""
        for e in error
          html += "<li>#{e}</li>"
        @$('#success').hide()
        @$('#errors').show().find('ul').html(html)
