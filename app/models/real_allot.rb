class RealAllot < ApplicationRecord
  belongs_to :verb

  # 当日の記録用レコードを作成する
  def self.today_record_create(verb_id, user_id)
    real_allot = RealAllot.find_by(verb_id: verb_id, created_at: Time.zone.now.all_day)
    RealAllot.create!(verb_id: verb_id) if real_allot.blank?
    DetailRealAllot.create!(verb_id: verb_id, user_id: user_id, begin_time: Time.zone.now)
  end
end
