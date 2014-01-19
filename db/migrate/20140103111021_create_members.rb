class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :id
      t.string :number
      t.string :name_en
      t.string :name_ja
      t.string :name_ja_yomi
      t.datetime :join_date
      t.text :comment
      t.integer :status

      t.timestamps
    end
  end
end
