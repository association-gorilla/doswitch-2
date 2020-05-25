# lib/tasks/rss.rake
namespace :action_restart do
  # 日をまたぐ時に動いてるアクションを再スタート
  task day_beyond_restart: :environment do
    # 計画していた通知時間がきているユーザーをチェックして格納
    detail_real_allots = DetailRealAllot.where(end_time: nil)
    if detail_real_allots.present?
      detail_real_allots.each do |detail_real_allot|
        # どのアクションか特定
        verb = detail_real_allot.verb
        # 詳細配分を前日終日までに更新
        detail_real_allot.update!(end_time: 1.day.ago.in_time_zone('Tokyo').end_of_day)
        real_allot = RealAllot.find_by(verb_id: verb.id, created_at: 1.day.ago.in_time_zone('Tokyo').all_day)
        # 前日のreal_allotを終日配分を足して更新
        real_allot.update!(allot: real_allot.allot.to_i + (1.day.ago.in_time_zone('Tokyo').end_of_day - detail_real_allot.begin_time).abs)
        # 翌日のreal_allotを作成
        RealAllot.create!(verb_id: verb.id)
        # 現在実行中だった詳細配分をスタートを翌日の始めにして作成
        DetailRealAllot.create!(verb_id: verb.id, user_id: detail_real_allot.user_id, begin_time: Time.now.in_time_zone('Tokyo').beginning_of_day)
      end
    end
  end
end
