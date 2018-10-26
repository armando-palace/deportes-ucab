class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  def update
    debugger
    if @game.update!(game_params)
      redirect_to @game.pairing.tournament
    else
      render :edit
    end
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(
        :start_date, :start_time, :winner_team_ids
      )
    end
end