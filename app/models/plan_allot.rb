class PlanAllot < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :rewards, dependent: :destroy
  belongs_to :user
  belongs_to :verb
end
