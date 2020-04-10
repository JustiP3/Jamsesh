class BandsController < ApplicationController
  def index
    @bands = Band.all 
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def new
    @band = Band.new 
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def create
  end 
  def update
  end 
end
