class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :plan_allot
end
