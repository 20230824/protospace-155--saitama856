class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update, :show]
  before_action :move_to_session, except: [:index, :show]

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

  def edit
    return if @prototype.user == current_user
    redirect_to root_path
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :prototype_title, :prototype_catch_copy,
                                      :prototype_concept).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
