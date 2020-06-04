namespace :achieve_record do
  # 昨日の実績を保存
  task yesterday_allot_save: :environment do
    # 昨日行動があったユーザーを収集
    actioned_users = RealAllot.where(created_at: 1.day.ago.all_day).map(&:user).uniq
    actioned_users.each do |actioned_user|
      # もう作成済みであれば作成しない
      next if AchieveRecord.find_by(user_id: actioned_user.id, created_at: 1.day.ago.all_day)

      real_allots = RealAllot.where(user_id: actioned_user.id, created_at: 1.day.ago.all_day).order(:verb_id)
      real_allots.each do |real_allot|
        # real_allotのレコードの分だけ達成記録としてレコードを作成する
        AchieveRecord.create!(user_id: real_allot.user_id, verb_name: real_allot.verb.name, allot: real_allot.allot)
      end
    end
  end
end
