class UsersController < ApplicationController
  def show
    session.destroy
    redirect_to '/'
  end
end