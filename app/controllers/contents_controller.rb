class ContentsController < ApplicationController
  before_filter :confirm_logged_in

  def index
    list

     respond_to do |format|
      format.html {render "list"}
      format.xml { render :xml => @links.to_xml }
    end    
  end

  #2DO: Array of arrays [today, yesterday, earlier]
  def list
    @links = Content.where(:user_id => session[:user_id])    
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
