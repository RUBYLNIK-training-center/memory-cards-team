# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :current_card, only: %i[show edit update destroy]

  def index
    @cards = Card.all
  end

  def show; end

  def new
    @card = Card.new
  end

  def create
    card = Card.create(card_params)

    redirect_to cards_path(card)
  end

  def edit; end

  def update
    @card.update(card_params)

    redirect_to card_path(@card)
  end

  def destroy
    @card.destroy

    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer)
  end

  def current_card
    @card = Card.find(params[:id])
  end
end
