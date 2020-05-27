namespace :achieve_record do
  # 日をまたぐ時に動いてるアクションを再スタート
  task yesterday_allot_save: :environment do
    actioned_users = RealAllot.where(created_at: Time.current.in_time_zone('Tokyo').all_day).map(&:user).uniq
    # actioned_users = RealAllot.where(created_at: 1.day.ago.in_time_zone('Tokyo').all_day).map{|u|u.user}.uniq
    actioned_users.each do |actioned_user|
      # もう作成済みであれば作成しない
      next if AchieveRecord.find_by(user_id: actioned_user.id)

      real_allots = RealAllot.where(user_id: actioned_user.id, created_at: Time.current.in_time_zone('Tokyo').all_day)
      # もしreal_allotが行動履歴が無い場合は実行しない
      next if real_allots.blank?

      real_allots.each do |real_allot|
        # real_allotのレコードの分だけ達成記録としてレコードを作成する
        AchieveRecord.create!(user_id: real_allot.user_id, verb_name: real_allot.verb.name, allot: real_allot.allot)
      end
    end
  end
end
