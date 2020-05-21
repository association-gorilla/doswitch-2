module HomesHelper
  # 実行時間のスタート/ストップのリンクの切り替え
  def record_toggle(verb)
    case DetailRealAllot.find_by(verb_id: verb.id, end_time: nil).blank?
    when true
      if RealAllot.where(verb_id: verb.id, created_at: Time.zone.now.all_day).blank?
        tag.a('計測スタート', href: record_start_path(user_id: current_user.id, id: verb.id), class: 'btn btn-info') +
          tag.p('現在の実行時間　00:00:00')
      else
        tag.a('計測スタート', href: record_start_path(user_id: current_user.id, id: verb.id), class: 'btn btn-info') +
          tag.p('現在の実行時間　' + Time.at(RealAllot.find_by(verb_id: verb.id, created_at: Time.zone.now.all_day).allot).utc.strftime('%X'))
      end
    when false
      tag.a('計測ストップ', href: record_stop_path(user_id: current_user.id, id: verb.id), class: 'btn btn-warning') +
        (tag.input id: 'record-time', type: 'hidden', value: recording_time_set(verb)) +
        (tag.p id: 'record_time_output')
    end
  end

  #  アクションの今日の実行時間を返す
  def recording_time_set(verb)
    RealAllot.find_by(verb_id: verb.id, created_at: Time.zone.now.all_day).allot
  end
end
