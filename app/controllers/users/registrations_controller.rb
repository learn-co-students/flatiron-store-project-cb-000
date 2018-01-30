class Users::RegistrationsController < Devise::RegistrationsController

  layout "form_layout"

  def new
    super
  end

  def create
    resource = build_resource(user_params)
    if resource.save
      sign_in(resource_name, resource)
      set_current_cart
      redirect_to store_path, :flash => {:notice => "You've signed in successfully!"}
    else
      flash[:errors] = resource.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if user.find_by(:id => params_id)
      user.delete
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
