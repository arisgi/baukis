class Admin::SessionsController < ApplicationController
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      administrator = Administrator.find_by(email_for_index: @form.email.downcase)
    end
    if administrator
      if administrator.suspended?
        render action: 'new'
      else
        session[:administrator_id] = administrator.id
        redirect_to :admin_root
      end
    else
      render action: 'new'
    end
  end
end
