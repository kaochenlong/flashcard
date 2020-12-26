class CardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_my_card, only: [:edit, :update, :destroy]

  def search
    keyword = params[:keyword]
    @cards = Card.search(keyword).page(params[:page]).per(3)
  end

  def import
    # 匯入！
    # JOB!
    TenlongJob.set(wait: 5.seconds).perform_later(current_user)

    redirect_to root_path, notice: "卡片已匯入"
  end

  def index
    @cards = Card.page(params[:page]).per(10).order(id: :desc)
  end

  def show
    @card = Card.find(params["id"])
    @comment = Comment.new
    @comments = @card.comments.order(id: :desc)
  end

  def like
    card = Card.find(params[:id])
    if current_user.like_cards.include?(card)
      current_user.like_cards.delete(card)
      render json: { status: 0 }
    else
      current_user.like_cards << card
      render json: { status: 1 }
    end
  end

  def new
    @card = Card.new
  end

  def create
    # @card = Card.new(card_params)
    @card = current_user.cards.new(card_params)

    if @card.save
      # flash[:notice] = "新增卡片成功"
      redirect_to "/", notice: "新增卡片成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to "/", notice: '卡片更新成功'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to "/", notice: '卡片已刪除'
  end

  private
  def card_params
    params.require(:card).permit(:title, :content, :photo)
  end

  def find_my_card
    @card = current_user.cards.find(params["id"])
    # @card = Card.find_by(id: params["id"], user_id: current_user.id)
  end
end
