class HomesController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def about; end

  def top
    @important_verbs = Verb.where(user_id: current_user.id, important: true)
    @selected_verbs = Verb.where(user_id: current_user.id, selected: true, important: false)
    # 計測中のアクションの再スタート
    DetailRealAllot.restart(current_user.id)
  end

  def record_start
    # 計測中のアクションが他にあればそれを止める
    DetailRealAllot.other_action_stop(current_user.id)
    # 当日の記録用レコードを作成する
    RealAllot.today_record_create(params[:id], current_user.id)
    flash[:success] = '「' + Verb.find(params[:id]).name + '」の計測を開始しました'
    # 開始するときはajaxが取り違えた時刻を表示するので、リダイレクトさせる
    redirect_to request.referer
  end

  def record_stop
    DetailRealAllot.action_stop(params[:id])
    flash.now[:success] = '計測を終了しました'
    @verb = Verb.find(params[:id])
    # 停止する時は非同期
    render :record_stop
  end
end
