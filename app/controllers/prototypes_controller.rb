class PrototypesController < ApplicationController
  before_action :move_to_session, except: [:index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :prototype_title, :prototype_catch_copy,
                                      :prototype_concept).merge(user_id: current_user.id)
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
