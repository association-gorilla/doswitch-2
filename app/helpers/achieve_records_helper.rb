module AchieveRecordsHelper
  # 実際と計画の時間と達成度を返すメソッド
  def plan_compare(plan_allot, select_day)
    real_allot_time = plan_allot.verb.real_allots.find_by(created_at: select_day).allot
    plan_allot_time = plan_allot.allot_h * 3600 + plan_allot.allot_m * 60
    tag.p('目標/計画　' + set2fig(real_allot_time / 3600) + ':' + set2fig(real_allot_time % 3600 / 60) + ':' + set2fig(real_allot_time % 3600 % 60) +
      ' / ' + set2fig(plan_allot.allot_h) + ':' + set2fig(plan_allot.allot_m) + ':00') +
      tag.p((real_allot_time * 100.0 / plan_allot_time).round.to_s + '%達成！')
  end

  # 時間を2桁にして返すメソッド
  def set2fig(num)
    if num < 10
      '0' + num.to_s
    else
      num.to_s
    end
  end
end
