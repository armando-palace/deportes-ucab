class SchoolsController < ApplicationController
  before_action :set_school, except: [:index]

  def edit
  end

  def index
    @schools = School.all
  end

  def update
    if current_user.update(school: @school)
      flash[:notice] = "Indicaste tu escuela exitosamente."
      redirect_to profile_path
    else
      flash.now[:danger] = "No se pudo asignarte a tu escuela."
      render "index"
    end
  end

  private

    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      # params.require(:school).permit(users_attributes: [:id])
    end
end