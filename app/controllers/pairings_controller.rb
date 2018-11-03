class PairingsController < ApplicationController
  before_action :set_pairing, only: [:edit, :update, :destroy]

  def create
    @pairing = Pairing.new(pairing_params)

    @pairing.match

    if @pairing.save
      redirect_to @pairing.tournament
    else
      redirect_to @pairing.tournament
    end
  end

  def destroy
    tournament = @pairing.tournament
    @pairing.destroy
    unless tournament.pairings.empty?
      tournament.pairings.last.update_attribute(:round_finished, false)
    end
    redirect_to tournament
  end

  def update
    if @pairing.update(pairing_params)
      redirect_to @pairing.tournament
    else
      render "edit"
    end
  end

  private
    def set_pairing
      @pairing = Pairing.find(params[:id])
    end

    def pairing_params
      params.require(:pairing).permit(:name, :tournament_id)
    end

    # def pairing_params2
    #   params.require(:pairing).permit()
    # end
end