class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_account
    account_id = params[:account_id] ? params[:account_id] : params[:id]
    @account ||= Account.find account_id
  end
end
