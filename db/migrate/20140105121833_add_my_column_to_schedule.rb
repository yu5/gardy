class AddMyColumnToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :place, :string
  end
end
