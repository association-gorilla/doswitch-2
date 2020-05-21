class HomesController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def about; end

  def top
    @important_verbs = Verb.where(user_id: current_user.id, important: true)
    @selected_verbs = Verb.where(user_id: current_user.id, selected: true, important: false)
    # 計測中のアクションの再スタート
    DetailRealAllot.restart(current_user)
  end

  def record_start
    # 計測中のアクションが他にあればそれを止める
    DetailRealAllot.other_action_stop(current_user)
    # 当日の記録用レコードを作成する
    RealAllot.today_record_create(params[:id], current_user)
    flash[:success] = '「' + Verb.find(params[:id]).name + '」の計測を開始しました'
    redirect_to request.referer
  end

  def record_stop
    DetailRealAllot.action_stop(params[:id])
    flash[:success] = '計測を終了しました'
    redirect_to request.referer
  end
end
