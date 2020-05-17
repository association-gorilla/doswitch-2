class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.integer :plan_allot_id
      # ご褒美
      t.string :profit
      t.string :penalty
      t.timestamps
    end
  end
end
