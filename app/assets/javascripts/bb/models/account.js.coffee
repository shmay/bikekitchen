App.Models.Account = Backbone.Model.extend
  set: (key,value,options) ->
    if _.isObject(key) || key == null
      attrs = key
      options = value
    else
      attrs = {}
      attrs[key] = value

    if attrs.created_at
      attrs['js_created_at'] = attrs.created_at.toDate()

    Backbone.Model.prototype.set.call(this, attrs, options)

  url: ->
    url = "/accounts"
    if @id
      url += "/#{@id}"
    url
