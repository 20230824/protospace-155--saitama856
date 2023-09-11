class UsersController < ApplicationController

def show
  @prototypes = current_user.prototypes
  @name = current_user.user_name
  @profile = current_user.user_profile
  @occupation = current_user.user_occupation
  @position = current_user.user_position
end

end
