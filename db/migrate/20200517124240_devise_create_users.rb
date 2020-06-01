# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ''
      t.string :image_id
      t.string :encrypted_password, null: false, default: ''
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
      t.datetime :deleted_at
    end
    add_index :users, :email, unique: true, where: 'deleted_at IS NULL'
    add_index :users, :reset_password_token, unique: true
  end
end
