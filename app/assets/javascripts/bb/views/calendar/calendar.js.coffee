App.Views.Calendar = Backbone.View.extend
  id:'calendar'
  className:'span12'
  template: JST["bb/tmpl/calendar"]

  initialize: ->
    @months = ['January','February','March','April','May','June','July','August','September','October','December']
    @days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
    @appEvents = App.events
    @appEvents.on 'change',@changeEv, this
    @appEvents.on 'add',@render, this
    @date = new Date()

  events:
    "click i":"clickIcon"
    "click a":"clickLink"

  render: ->
    console.log 'render'
    date = @date
    month = @month = @date.getMonth()

    @$el.html @template
      days:@days
      date:date
      month:month
      friendly_month:@months[month]
      start_day:(new Date(2012,month,1)).getDay()
      date_and_month: (count,start_day,month) =>
        date = new Date(2012,month,(count - start_day))
        day = date.getDate()
        html = "<a href='#' class='day'>#{day}</a>"

        if date.getMonth() != month
          html += " #{@months[date.getMonth()][0...3]}"

        events = _.filter @appEvents.models, (event) ->
          time = event.get('js_day_time')
          112 == time.getYear() and month == time.getMonth() and day == time.getDate()

        if events.length
          for ev in events
            html += """<br/>
              <div id='ev_#{ev.id}' class='ev'>
              #{@renderEv(ev)}
              </div>
            """

        html
    this

  renderEv: (ev) ->
    html = """
      <b>#{ev.get('time')}</b>
      <i title='#{if @admin then 'Edit this event' else 'Sign up for this event'}' class='tip icon icon-pencil edit'></i>
     """

    if ev.get('slots')
      html += """<br/> #{ev.get('users').length}/#{ev.get('slots')} slots """

    html += "
      <br/>
      #{ev.get('name')}
    "

  addEv: (ev) ->

  changeEv: (ev) ->
    div = @$("#ev_#{ev.id}")
    div.html @renderEv ev

  clickLink: (e) ->
    e.preventDefault()
    e.stopPropagation()
    target = @$(e.currentTarget)
    day = target.text()
    view = new App.Views.EventForm
      model:new App.Models.Event()
      collection:@collection
      month:@month
      day:day
    title = "Add an Event to #{@months[@month]} #{day}"
    App.openModal title, view

  clickIcon: (e) ->
    target = @$(e.currentTarget)
    if target.hasClass('edit')
      ev = target.closest('.ev')
      day = ev.find('.day').text()
      id = ev.attr('id').match(/\d+/)[0]
      view = new App.Views.EventForm
        model:@appEvents.get(id)
        collection:@collection
        month:@month
        day:day
      title = "Editing Event #{@months[@month]} #{day}"
      App.openModal title, view
    else
      if target.hasClass('next')
        @date.setMonth @date.getMonth() + 1
      else
        @date.setMonth @date.getMonth() - 1

      @render()
