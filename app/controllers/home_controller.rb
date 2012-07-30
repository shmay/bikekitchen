class HomeController < ApplicationController
  layout 'corporate'

  def index
    if user_signed_in?
      @account = current_user.account
    end
  end
end
