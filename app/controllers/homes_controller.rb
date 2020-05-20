class HomesController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def about; end

  def top
    @important_verbs = Verb.where(user_id: current_user.id, important: true)
    @selected_verbs = Verb.where(user_id: current_user.id, selected: true, important: false)
  end

  def record_start
    real_allot = RealAllot.where(verb_id: params[:id], created_at: Time.zone.now.all_day).first
    RealAllot.create!(verb_id: params[:id]) if real_allot.blank?
    DetailRealAllot.create!(verb_id: params[:id], user_id: current_user.id, begin_time: Time.zone.now)
    flash[:success] = '計測開始しました'
    redirect_to request.referer
  end

  def record_stop
    detail_real_allot = DetailRealAllot.find_by(verb_id: params[:id], end_time: nil)
    detail_real_allot.update(end_time: Time.zone.now)
    real_allot = RealAllot.where(verb_id: params[:id], created_at: Time.zone.now.all_day).first
    real_allot.update(allot: real_allot.allot.to_i + (Time.zone.now - detail_real_allot.begin_time))
    flash[:success] = '計測を終了しました'
    redirect_to request.referer
  end
end
