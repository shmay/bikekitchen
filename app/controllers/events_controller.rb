class EventsController < ApplicationController
  before_filter :current_account
  def create
    @event = Event.new(params[:event])
    @event.account_id = @account.id

    if params[:day]
      date = Date.new 2012, params[:month].to_i + 1, params[:day].to_i
      @event.day = date
    end

    respond_to do |format|
      if @event.save
        format.json { render json: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.json {render json: @event.to_json(except:[:updated_at])}
      else
        format.json { render json: @event.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
end
