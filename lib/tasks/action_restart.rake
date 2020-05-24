# lib/tasks/rss.rake
namespace :action_restart do
  # 日をまたぐ時に動いてるアクションを再スタート
  task day_beyond_restart: :environment do
    # 計画していた通知時間がきているユーザーをチェックして格納
    detail_real_allots = DetailRealAllot.where(end_time: nil)
    detail_real_allots.each do |detail_real_allot|
      tmp_verb = detail_real_allot.verb
      # 1.day.ago.end_of_dayで前日を指定
      detail_real_allot.update(end_time: 1.day.ago.end_of_day)
      # 1.days.ago.all_dayで前日の全範囲指定
      real_allot = RealAllot.find_by(verb_id: tmp_verb.id, created_at: 1.days.ago.all_day)
      real_allot.update(allot: real_allot.allot.to_i + (1.day.ago.end_of_day - detail_real_allot.begin_time))
      # Time.now.beginning_of_dayで今日の始まりを指定
      DetailRealAllot.create!(verb_id: tmp_verb.id, user_id: user_id, begin_time: Time.now.beginning_of_day)
    end
  end
end
