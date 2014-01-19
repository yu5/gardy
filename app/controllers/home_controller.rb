class HomeController < ApplicationController
  def index
    day=Time.now - 2.day
    @schedules = Schedule.where("kick_date >= ?", day).order("kick_date ASC")
  end
end
