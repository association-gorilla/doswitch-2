class PlanAllotsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def index
    @user_plan_allots = PlanAllot.where(user_id: current_user.id)
    @today_plan_allots = PlanAllot.today_plan_search(@user_plan_allots)
    @plan_allot = PlanAllot.new
    @important_verbs = Verb.where(user_id: current_user.id, important: true)
  end

  def create
    plan_allot = PlanAllot.new(plan_allot_params)
    plan_allot.user_id = current_user.id
    if plan_allot.save!
      flash[:success] = '計画の作成ができました'
    else
      flash[:danger] = '計画の作成に失敗しました'
    end
    redirect_to request.referer
  end

  def update
    plan_allot = PlanAllot.find(params[:id])
    if plan_allot.update!(plan_allot_params)
      flash[:success] = '計画の更新ができました'
    else
      flash[:danger] = '計画の更新に失敗しました'
    end
    redirect_to request.referer
  end

  def destroy
    plan_allot = PlanAllot.find(params[:id])
    if plan_allot.delete
      flash[:success] = '計画の削除ができました'
    else
      flash[:danger] = '計画の削除に失敗しました'
    end
    redirect_to request.referer
  end

  private

  def plan_allot_params
    params.require(:plan_allot).permit(:user_id, :verb_id, :allot_h, :allot_m, :begin_date, :end_date)
  end
end
