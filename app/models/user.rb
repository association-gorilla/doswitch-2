class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # refileでイメージ画像を扱えるようにする
  attachment :image
  # 論理削除するために必要
  acts_as_paranoid

  has_many :verbs, dependent: :destroy
  has_many :achieve_rates, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :detail_real_allots, dependent: :destroy
  has_many :detail_plan_allots, dependent: :destroy
end
