# frozen_string_literal: true

class ApplicationController < ActionController::Base
   # CSRF対策 サイトへのコード攻撃を防ぐ
   protect_from_forgery with: :exception
   # devise動作時の利用カラムを制限する
   before_action :configure_permitted_parameters, if: :devise_controller?
   helper_method :logged_in?

   protected

   def configure_permitted_parameters
     added_attrs = [:name, :email, :password, :password_confirmation]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   end

   def logged_in?
     !session[:user_id].nil?
   end
 end
