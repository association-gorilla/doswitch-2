class AchieveRecordsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def index
    # 日付が同じのレコードも集計される
    active_records = AchieveRecord.where(user_id: current_user.id)
    # 実績があった日付の配列を用意
    @record_days = AchieveRecord.only_oneday_records(active_records)
  end

  def show
    @active_records = AchieveRecord.where(created_at: Time.zone.parse(params[:day]).all_day)
    @action_chart = AchieveRecord.allot_distribution(@active_records)
  end
end
