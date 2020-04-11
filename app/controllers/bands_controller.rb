class BandsController < ApplicationController
  def index
    @bands = Band.all 
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def new
    @band = Band.new 
    @user = User.new #collection select user
    @user2 = User.new #type username search
    @users = User.all 
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def create
    raise params.inspect
  end 
  def update
  end 
end
