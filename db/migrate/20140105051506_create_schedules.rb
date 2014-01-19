class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :id
      t.date :kick_date
      t.time :start_time
      t.time :end_time
      t.string :title
      t.text :contents
      t.boolean :open_flag
      t.string :register

      t.timestamps
    end
  end
end
