class SessionsController < ApplicationController
  def new
  end

  def create
    @password = params[:password]
    if @password && Digest::SHA2.hexdigest(@password) == ENV['ADMIN_PASSWORD_DIGEST']
      session[:login] = true
      flash[:success] = 'ログインしました'
      redirect_to root_path
    else
      flash.now[:danger] = 'パスワードが異なります'
      render 'new'
    end
  end

  def destroy
    session[:login] = false
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
