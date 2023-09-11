class PrototypesController < ApplicationController

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    redirect_to '/'
  end

  private
  def prototype_params
    params.require(:prototype).permit(:image, :prototype_title, :prototype_catch_copy, :prototype_concept).merge(user_id: current_user.id)
  end

end
