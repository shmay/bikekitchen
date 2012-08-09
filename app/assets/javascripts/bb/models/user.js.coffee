App.Models.User = Backbone.Model.extend
  url: ->
    if @id
      "/users/#{@id}"
    else
      "/users"

  validate: (attrs) ->
    errors = []
    if not attrs.name
      errors.push "need a name bro"

    if _.any(errors)
      return errors

App.Lists.Users = Backbone.Collection.extend
  model: App.Models.User
  url: -> "/users"
  comparator: (user) -> user.get('name')
