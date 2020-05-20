class CreateAchieveRates < ActiveRecord::Migration[5.2]
  def change
    create_table :achieve_rates do |t|
      t.integer :user_id
      t.integer :verb_id
      # 1日の達成度
      t.float :date_rate
      t.timestamps
    end
  end
end
