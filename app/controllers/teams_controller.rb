class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_sport, only: [:show, :edit, :update, :destroy]
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end


  def new
    @team = Team.new
  end


  def edit
  end

  def create
    @team = current_user.teams.new(team_params)
    @team.sport = @sport
    @team.tournament = @tournament

    if @team.save
      redirect_to @team.sport, notice: 'Equipo creado correctamente'
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
       redirect_to @team, notice: 'Equipo actualizado correctamente'
    else
       render :edit
    end

  end


  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Equipo eliminado correctamente'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def set_sport
      @sport = Sport.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :nickname, :tournament_id, :team_id)
    end
end
