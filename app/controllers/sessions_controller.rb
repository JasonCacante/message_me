# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password]) # if user exists and password is correct
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in.'
      redirect_to root_path
    else
      flash[:error] = 'There was something wrong with your login information.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out.'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in.'
    redirect_to root_path
  end
end
