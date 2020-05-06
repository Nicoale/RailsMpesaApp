class StatisticsController < ApplicationController
  def home
    render json: {status: "Its Working!"}
  end
end
