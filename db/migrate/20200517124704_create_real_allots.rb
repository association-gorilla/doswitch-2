class CreateRealAllots < ActiveRecord::Migration[5.2]
  def change
    create_table :real_allots do |t|
      t.integer :action_id, null: false
      # 実際の取り組みの配分
      t.float :allot
      # 実際の取り組み日数
      t.datetime :term
      t.timestamps
    end
  end
end
