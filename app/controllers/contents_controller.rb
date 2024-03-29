class ContentsController < ApplicationController
  before_filter :confirm_logged_in

  def index
    list

    respond_to do |format|
      format.html {render "list"}
      format.xml { render :xml => @links }
    end    
  end

  #2DO: Array of arrays [today, yesterday, earlier]
  def list
    all_user_links = Content.where(:user_id => session[:user_id])
    @links = Hash.new
    @links[:today] = all_user_links.today
    @links[:yesterday] = all_user_links.yesterday
    @links[:earlier] = all_user_links.earlier    
  end

  def new
    @link = Content.new(:user_id => session[:user_id])
  end

  def create
    @link = Content.new(params[:content])
    if @link.save
      index
    else
      flash[:notice] = "Can't add link, amigo. Try it again"
      render "new"
    end
  end

  def delete
    link = Content.find(params[:id])
    link.destroy
    flash[:notice] = "your link has been annihilated, amigo }:-]"
    redirect_to(:action => 'list', :user_id => session[:user_id])
  end

end
