class PairingsController < ApplicationController
  def create
    @pairing = Pairing.new(pairing_params)

    @pairing.match

    if @pairing.save
      redirect_to @pairing.tournament
    else
      redirect_to @pairing.tournament
    end
  end

  private
    def pairing_params
      params.require(:pairing).permit(:tournament_id)
    end
end