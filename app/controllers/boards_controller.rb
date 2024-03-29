# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_board, except: %i[index new create]

  def index
    @boards = current_user.boards
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = t('flash.boards.create.success')
      redirect_to boards_path
    else
      flash_error
      render 'new'
    end
  end

  def update
    if @board.update(board_params)
      flash[:success] = t('flash.boards.update.success')
      redirect_to boards_path
    else
      flash_error
      render 'edit'
    end
  end

  def destroy
    @board.destroy
    flash[:warn] = t('flash.boards.destroy.success')
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board)
          .permit(:name,
                  :description)
  end

  def find_board
    @board = current_user.boards.find_by(id: params[:id])
    redirect_to boards_path, flash: { error: t('flash.boards.no_access') } if @board.nil?
  end

  def flash_error
    flash.now[:error] = @board.errors.full_messages[0]
  end
end
