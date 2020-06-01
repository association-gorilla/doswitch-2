class CreatePlanAllots < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_allots do |t|
      t.integer :verb_id, null: false
      t.integer :user_id, null: false
      # 取り組みの配分
      t.integer :allot_h
      t.integer :allot_m
      # 取り組み日数
      t.date :begin_date
      t.date :end_date
      t.timestamps
    end
  end
end
