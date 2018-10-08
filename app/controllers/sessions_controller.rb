class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_params)
     if user && user.authenticate(password_params)
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  private
  def email_params
    params.require(:session).permit(:email)
  end

  private
  def password_params
    params.require(:session).permit(:password)[:password]
#    params
    # -> {session: {:email: hogeho, password: xyz}........}
#    session = params.require(:session)
    # -> {:email: hogeho, password: xyz. :::::::}
#    permit = session.permit(:password)
    # -> {password: xyz}
#    permit[:passoword]
    # -> xyz
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

end
