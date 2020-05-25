class DetailRealAllot < ApplicationRecord
  belongs_to :user
  belongs_to :verb

  # アクションの再スタート
  def self.restart(user_id)
    detail_real_allot = DetailRealAllot.find_by(user_id: user_id, end_time: nil)
    # 計測中のアクションがある場合は実行
    return unless detail_real_allot

    tmp_verb = detail_real_allot.verb
    # 再スタートして、表示のリセットを防ぐ
    action_stop(tmp_verb.id)
    DetailRealAllot.create!(verb_id: tmp_verb.id, user_id: user_id, begin_time: Time.zone.now.in_time_zone('Tokyo'))
  end

  # 他のアクションがあれば止める
  def self.other_action_stop(user_id)
    detail_real_allot = DetailRealAllot.find_by(user_id: user_id, end_time: nil)
    # 計測中のアクションがある場合は実行
    return unless detail_real_allot

    tmp_verb = detail_real_allot.verb
    action_stop(tmp_verb.id)
  end

  # アクションを停止して現状の進み具合を保存するメソッド
  def self.action_stop(verb_id)
    detail_real_allot = DetailRealAllot.find_by(verb_id: verb_id, end_time: nil)
    detail_real_allot.update(end_time: Time.zone.now.in_time_zone('Tokyo'))
    real_allot = RealAllot.find_by(verb_id: verb_id, created_at: Time.zone.now.in_time_zone('Tokyo').all_day)
    real_allot.update(allot: real_allot.allot.to_i + (Time.zone.now.in_time_zone('Tokyo') - detail_real_allot.begin_time))
  end
end
