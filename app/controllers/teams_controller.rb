class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_players, only: [:new, :edit]
  before_action :set_tournament
  before_action :authenticate_user!

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  # def show
  # end

  def new
    @team = Team.new
  end

  # def edit
  # end

  def create
    @team = current_user.teams.new(team_params)
    @team.tournament = @tournament

    if @team.save
      redirect_to @team.tournament, notice: 'Equipo creado correctamente'
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team.tournament, notice: 'Equipo actualizado correctamente'
    else
      render :edit
    end
  end


  def destroy
    @team.destroy
    redirect_to tournament_teams_path, alert: 'Equipo eliminado correctamente'
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    def set_players
      @players = current_user.players
    end

    def team_params
      params.require(:team).permit(
        :name, :nickname, :tournament_id, :user_id, player_ids: []
      )
    end
end
