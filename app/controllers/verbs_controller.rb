class VerbsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def create
    verb = Verb.new
    if verb.save(verb_params)
      flash[:success] = '新しい行動登録に成功しました。'
      redirect_to request.referer
    else
      flash[:danger] = '行動の登録に失敗しました。'
      render :new
    end
  end

  def edit
    @verb = Verb.new
    @important_verbs = Verb.where(user_id: current_user.id, important: true)
    @selected_verbs = Verb.where(user_id: current_user.id, selected: true, important: false)
    @verbs = Verb.where(user_id: current_user.id, selected: false, important: false)
  end

  def update
    verb = Verb.find(params[:id])
    if verb.update!(verb_params)
      flash[:success] = '行動の更新に成功しました'
    else
      flash[:danger] = '行動の更新に失敗しました'
    end
    redirect_to request.referer
  end

  def destroy
    verb = Verb.find(params[:id])
    if verb.destroy
      flash[:success] = '行動の削除に成功しました'
    else
      flash[:danger] = '行動の削除に失敗しました'
    end
    redirect_to request.referer
  end

  def update_important
    verb = Verb.find(params[:id])
    Verb.bool_change(verb, status: :important)
    flash[:success] = '優先アクションのステータスを変更しました。'
    redirect_to request.referer
  end

  def update_selected
    verb = Verb.find(params[:id])
    Verb.bool_change(verb, status: :selected)
    flash[:success] = '設定中アクションのステータスを変更しました。'
    redirect_to request.referer
  end

  private

  def verb_params
    params.require(:verb).permit(:name, :selected, :important)
  end
end
