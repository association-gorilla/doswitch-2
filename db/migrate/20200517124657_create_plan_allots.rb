class CreatePlanAllots < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_allots do |t|
      t.integer :verb_id, null: false
      # 取り組みの配分
      t.float :allot
      # 取り組み日数
      t.datetime :term
      t.timestamps
    end
  end
end
