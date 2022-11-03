class AdminsController < ApplicationController
  def login
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_path(admin)
    else
      flash[:notice] = 'Invalid email or password'
      redirect_to root_path
    end
  end

  def logout
    session[:admin_id] = nil
    redirect_to root_path
  end
end
