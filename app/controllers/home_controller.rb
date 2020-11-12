class HomeController < ApplicationController
  def index
    ExampleJob.set(wait: 5.seconds).perform_later
  end
end
