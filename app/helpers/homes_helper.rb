module HomesHelper
  # 実行時間のスタート/ストップのリンクの切り替え
  def record_toggle(verb)
    case DetailRealAllot.find_by(verb_id: verb.id, end_time: nil).blank?
    # 計測停止中の場合
    when true
      # real_allotがまだ無い、もしくは値がnilのときに実行
      if recording_time_set(verb).blank?
        tag.a('計測スタート', href: record_start_path(user_id: current_user.id, id: verb.id), class: 'btn btn-info') +
          tag.p('現在の実行時間　00:00:00')
      # それ以外はreal_allotの値を表示する
      else
        tag.a('計測スタート', href: record_start_path(user_id: current_user.id, id: verb.id), class: 'btn btn-info') +
          tag.p('現在の実行時間　' + Time.at(recording_time_set(verb)).utc.strftime('%X'))
      end
    # 計測実行中の場合
    when false
      tag.a('計測ストップ', href: record_stop_path(user_id: current_user.id, id: verb.id), class: 'btn btn-warning') +
        (tag.input id: 'record-time', type: 'hidden', value: recording_time_set(verb)) +
        (tag.p id: 'record_time_output')
    end
  end

  #  アクションの今日の実行時間を返す
  def recording_time_set(verb)
    today_real_allot = RealAllot.where(verb_id: verb.id, created_at: Time.zone.now.in_time_zone('Tokyo').all_day).last
    today_real_allot.allot if today_real_allot.present?
  end

  # 計画時間が制定してあれば表示する
  def plan_time(verb)
    return if verb&.plan_allots.blank?

    plan_allot = verb.plan_allots.first
    tag.p('目標時間　' + set2fig(plan_allot.allot_h) + ':' + set2fig(plan_allot.allot_m) + ':00')
  end

  # 時間を2桁にして返すメソッド
  def set2fig(num)
    if num < 10
      '0' + num.to_s
    else
      num.to_s
    end
  end

  # プランを達成していたら表示する
  def plan_clear(verb)
    plan_allot = verb.plan_allots.first
    plan_allot_time = plan_allot.allot_h * 3600 + plan_allot.allot_m * 60
    real_allot_time = recording_time_set(verb)
    if plan_allot_time < real_allot_time
      tag.i(class: 'fas fa-check fa-3x check_achieve_after')
    else
      tag.i(class: 'fas fa-check fa-3x check_achieve_before')
    end
  end
end
