class UsersController < ApplicationController
  def mypage
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      login_id: params[:login_id], 
      password: params[:password],
      name: params[:name]
      )

    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/mypage/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.login_id = params[:login_id]
    @user.password = params[:password]
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/mypage/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
    
  end
  
  def login
    @user=User.find_by(login_id: params[:login_id], password: params[:password])
   
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/mypage/#{@user.id}")
    else
      @error_message="メールアドレスまたはパスワードが間違っています"
      @login_id=params[:login_id]
      @password=params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
  
end
