class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # refileでイメージ画像を扱えるようにする
  attachment :image
  # 論理削除するために必要
  acts_as_paranoid
end
