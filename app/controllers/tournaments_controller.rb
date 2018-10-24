class TournamentsController < ApplicationController
  before_action :set_sport, only: [:new, :create, :destroy]
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = current_user.tournaments.new(tournament_params)
    @tournament.sport = @sport

    if @tournament.save
      redirect_to @tournament.sport, notice: 'Torneo creado correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    if @tournament.update(tournament_params)
      redirect_to @tournament, notice: 'Torneo editado correctamente.'
    else
      render :edit
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    redirect_to tournaments_url, alert: 'Torneo destruido.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def set_sport
      @sport = Sport.find(params[:sport_id])
    end

    def set_team
      @team = Team.where("tournament_id = ?", @tournament.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :description, :registration_start_date, :registration_end_date, :period , :sport_id, :team_id, :user_id)
    end
end
