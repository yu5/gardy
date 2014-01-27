class AttendanceList < ActiveRecord::Base
  attr_accessible :comment, :id, :member_id, :schedule_id, :status

  def self.select_insert_attendance_list(sche_id)
    sqlstr = "INSERT INTO attendance_lists (schedule_id, member_id, status, comment, created_at, updated_at) SELECT " + sche_id.to_s + ", id, 0, NULL, now(), now() FROM members;"
    return connection.execute(sqlstr)
  end

  def self.get_member_schedule(mem_id)
    sql = "SELECT al.schedule_id,al.member_id,al.status,al.comment,m.number,m.name_ja FROM attendance_lists AS al INNER JOIN schedules AS s ON al.schedule_id = s.id LEFT JOIN members AS m ON al.member_id=m.id WHERE al.member_id = ? AND s.kick_date > (CURDATE() - INTERVAL 2 DAY) ORDER BY s.kick_date;"
    return AttendanceList.find_by_sql([sql, mem_id.to_s])
  end

  def self.get_schedule_and_members(schedule_id)
    sql = "SELECT s.*, al.member_id, al.status AS attendance_stat, al.comment AS attendance_come, m.number,m.name_ja FROM attendance_lists AS al INNER JOIN schedules AS s ON al.schedule_id = s.id LEFT JOIN members AS m ON al.member_id=m.id WHERE al.schedule_id = ? ORDER BY m.number;"
    return AttendanceList.find_by_sql([sql, schedule_id.to_s])
  end

end
