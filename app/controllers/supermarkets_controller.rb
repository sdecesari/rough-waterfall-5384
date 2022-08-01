class SupermarketsController < ApplicationController
  def show 
    @supermarket = Supermarket.find(params[:id])
  end 

  def index 
    @supermarket = Supermarket.find(params[:id])
  end 
end 