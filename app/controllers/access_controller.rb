class AccessController < ApplicationController
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    redirect_to :controller => 'contents', :action => 'index'
  end
  
  def attempt_login
    user = User.find_by_email(params[:email])
    unless user
      user = User.new
      user.password = params[:password]
      user.email = params[:email]
      user.save      
    else
      unless user.password_match?(params[:password])
        flash[:notice] = "This password is not for this email, amigo!"
        render("login")
        return false
      end
    end
    session[:user_id] = user.id
    index
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "You\'ve been lodded out"
    render("login")
  end

end
