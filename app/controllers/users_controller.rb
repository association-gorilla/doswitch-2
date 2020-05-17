class UsersController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to edit_user_path
    else
      flash[:danger] = 'ユーザー情報を更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = 'ユーザーを削除しました'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :email)
  end
end
