class PagesController < ApplicationController
  def index
    Rails.logger.info Rails.configuration.session_store.inspect
    @count = session[:count].to_i
  end
end
