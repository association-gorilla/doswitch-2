class PlanAllot < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :rewards, dependent: :destroy
  belongs_to :user
  belongs_to :verb

  def self.today_plan_search(user_plan_allots)
    today_plan_allots = []
    user_plan_allots.each do |user_plan_allot|
      # 今日が計画日の範囲にある場合は追加
      today_plan_allots << user_plan_allot if (user_plan_allot.begin_date..user_plan_allot.end_date).include?(Time.zone.today)
    end
    today_plan_allots
  end
end
