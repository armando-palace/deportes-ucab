class SportsController < ApplicationController
  before_action :set_sport, only: [:show]

  def show
  end

  private

    def sport_params
      params.require(:sport).permit(:name)
    end

    def set_sport
      @sport = Sport.find(params[:id])
    end
end