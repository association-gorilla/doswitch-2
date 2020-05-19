class HomesController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def about; end

  def top
    @important_verbs = Verb.where(user_id: current_user.id, important: true)
    @selected_verbs = Verb.where(user_id: current_user.id, selected: true, important: false)
  end

  def record_start
    # real_allot = RealAllot.where(verb_id: params[:id], created_at: Time.now.all_day)
    RealAllot.create!(verb_id: params[:id])
    redirect_to request.referer
  end
end
