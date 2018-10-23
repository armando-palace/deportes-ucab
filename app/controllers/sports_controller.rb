class SportsController < ApplicationController
<<<<<<< HEAD
  before_action :set_sport, only: [:show]
=======
  before_action :set_sport, only: [:edit, :update, :show, :destroy]
  # before_action :tournament_search, only: [:show]
  before_action :authenticate_user!

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to sports_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sport.update(sport_params)
      redirect_to sports_path
    else
      render :edit
    end
  end
>>>>>>> master

  def show
  end

<<<<<<< HEAD
=======
  def index
    @sports = Sport.all
  end

  def destroy
    @sport.destroy
    redirect_to sports_path
  end

>>>>>>> master
  private

    def sport_params
      params.require(:sport).permit(:name)
    end

    def set_sport
      @sport = Sport.find(params[:id])
    end
<<<<<<< HEAD
end
=======

    # def tournament_search
    #   @tournament = Tournament.where("sport_id = ?", params[:id])
    # end
end
>>>>>>> master
