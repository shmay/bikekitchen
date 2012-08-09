class AccountsController < ApplicationController
  before_filter :current_account

  def show
    time = Time.now
    month = time.month
    start_day = Date.new(2012,month - 1,27)
    @events = @account.events.where(day:start_day..Date.new(2012,month + 1,1))
    @users = @account.users

    respond_to do |format|
      format.html
    end
  end
end
