class CardsController < ApplicationController
  def index
  end

  def new
  end

  def create
    #... 寫入資料
    redirect_to "/cards"
  end
end
