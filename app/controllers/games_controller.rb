class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  def edit
    if @game.scores.empty?
      2.times { @game.scores.build }
    end
  end

  def update
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
        :start_date, :start_time, :winner_team_ids,
        scores_attributes: [:id, :team_id, :player_id, :points]
      )
    end
end