App.Models.Event = Backbone.Model.extend
  defaults: ->
    name:''
    time:''
    slots:0
    users:new App.Lists.Users()

  paramRoot: 'event'

  set: (key,value,options) ->
    if _.isObject(key) || key == null
      attrs = key
      options = value
    else
      attrs = {}
      attrs[key] = value

    if attrs.day_time
      attrs['js_day_time'] = attrs.day_time.toDate()

    if attrs.slots
      attrs.slots = parseInt attrs.slots

    Backbone.Model.prototype.set.call(this, attrs, options)

  url: ->
    url = "/accounts/#{App.account.id}/events"
    if @id
      url += "/#{@id}"
    url

App.Lists.Events = Backbone.Collection.extend
  model: App.Models.Event
