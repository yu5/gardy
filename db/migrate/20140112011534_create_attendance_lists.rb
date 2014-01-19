class CreateAttendanceLists < ActiveRecord::Migration
  def change
    create_table :attendance_lists do |t|
      t.integer :id
      t.integer :schedule_id
      t.integer :member_id
      t.integer :status
      t.string :comment

      t.timestamps
    end
  end
end
