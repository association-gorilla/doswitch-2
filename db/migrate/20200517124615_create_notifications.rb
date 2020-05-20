class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :plan_allot_id
      # 計画タームの日数
      t.integer :term_num
      # 通知の種類
      t.string :behavior, default: '', null: false
      # 既読ならtrue
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end
end
