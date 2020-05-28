class CreateAchieveRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :achieve_records do |t|
      t.integer :user_id
      t.string :verb_name
      # 1日にこなした配分
      t.integer :allot
      t.timestamps
    end
  end
end
