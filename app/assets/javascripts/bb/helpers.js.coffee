String::toDate = ->
  matches = @match(/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z/)
  new Date(matches[1], matches[2] - 1, matches[3], matches[4],matches[5],matches[6])

$(document).on 'mouseenter', '.tip', -> $(this).tooltip().tooltip('show')
$(document).on 'mouseleave', '.tip', -> $(this).tooltip('hide')

$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name]
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""
  o

App.openModal = (title, view, fn) ->
  modal = $('#theModal')
  fn(modal) if fn
  modal.find('#title').text(title)
  modal.find('.modal-body').empty().append view.render().el
  modal.modal('show')
  modal.find('input:first').focus()
