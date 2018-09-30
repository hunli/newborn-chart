class WelcomeController < ApplicationController
  def index
    session[welcome_index_url] = true
  end
end
