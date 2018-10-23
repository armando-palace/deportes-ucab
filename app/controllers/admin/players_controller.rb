class Admin::PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update, :show, :destroy]

  def new
    @player = Player.new
    @player.t_shirts.build
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to admin_players_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to [:admin, @player]
    else
      render :edit
    end
  end

  def index
    @players = Player.all
  end

  def destroy
    @player.destroy
    redirect_to admin_players_path
  end

  private

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(
        :id_card, :first_name, :middle_name, :last_name,
        :school_id, :period_id, :team_id, :user_id,
        t_shirts_attributes: [:dorsal_number]
      )
    end
end