class PairingsController < ApplicationController
  # before_action :set_pairing, only: [:edit, :update]

  def create
    @pairing = Pairing.new(pairing_params)

    @pairing.match

    if @pairing.save
      redirect_to @pairing.tournament
    else
      redirect_to @pairing.tournament
    end
  end

  # def edit
  # end

  # def update
  #   if @pairing.update(pairing_params2)
      
  #   end
  # end

  private
    def set_pairing
      @pairing = Pairing.find(params[:id])
    end

    def pairing_params
      params.require(:pairing).permit(:tournament_id)
    end

    # def pairing_params2
    #   params.require(:pairing).permit()
    # end
end