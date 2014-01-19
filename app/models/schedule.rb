class Schedule < ActiveRecord::Base
  attr_accessible :contents, :end_time, :id, :kick_date, :open_flag, :register, :start_time, :title, :place

  def self.get_active_schedule()
    sql = "SELECT id, title, kick_date, start_time FROM schedules WHERE kick_date > (CURDATE() - INTERVAL 2 DAY) AND open_flag=1 ORDER BY kick_date;"
    return Schedule.find_by_sql([sql])
  end

end
