class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :plan_allot_id
      # 計画タームの日数
      t.integer :term_num
      t.string :behavior, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end
end
