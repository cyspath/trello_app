class Api::CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: @cards
  end

  # def show
  #   @card = Card.find(params[:id])
  #   render json: @card
  # end

  def create
    @card = Card.new(card_params)
    if @card.save
      render json: @card
    else
      render json: @card.errors.full_messages, status: 422
    end
  end

  # def update
  #   @card = Card.find(params[:id])
  #   if @card.update_attributes(card_params)
  #     render json: @card
  #   else
  #     render json: @card.errors.full_messages, status: 422
  #   end
  # end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy if @card
    render json: {}
  end

  def card_params
    params.require(:card).permit(:title, :user_id)
  end
end
