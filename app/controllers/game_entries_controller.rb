class GameEntriesController < ApplicationController
  before_action :require_login

  def index
    @game_entries = current_user.game_entries
  end

  def create
    @game_entry = current_user.game_entries.build(game_entry_params)

    if @game_entry.save
      redirect_to game_entries_path
    else
      @game = @game_entry.game
      render "games/show", status: :unprocessable_entity
    end
  end

  def edit
    @game_entry = current_user.game_entries.find(params[:id])
  end

  def update
    @game_entry = current_user.game_entries.find(params[:id])

    if @game_entry.update(game_entry_params)
      redirect_to game_entries_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game_entry = current_user.game_entries.find(params[:id])
    @game_entry.destroy

    redirect_to game_entries_path
  end

private

  def game_entry_params
    params.require(:game_entry).permit(
      :game_id,
      :status,
      :rating,
      :hours_played,
      :notes
    )
  end
end
