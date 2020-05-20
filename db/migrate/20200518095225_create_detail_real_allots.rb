class CreateDetailRealAllots < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_real_allots do |t|
      t.integer :verb_id, null: false
      t.integer :user_id, null: false
      # 詳細の計画の始まりの時間
      t.datetime :begin_time
      # 詳細の計画の終わりの時間
      t.datetime :end_time
      t.timestamps
    end
  end
end
