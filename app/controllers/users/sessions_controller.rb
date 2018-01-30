class Users::SessionsController < Devise::SessionsController

  layout  "form_layout"

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end


  private

  def user_login_params
  end


end
