class UsersController < ApplicationController
  def create
    if params[:password]
      if params[:password] == params[:password_confirmation]
        @user = User.create(user_params)
        @user.image = "default_image.jpeg"
        if @user.save
          session[:login_user_id] = @user.id
          flash[:notice] = "#{@user.name}でログインしました。"
          redirect_to("/")
        else
          @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
          flash[:notice] = "ユーザー登録に失敗しました。"
          render("posts/index")
        end
      else
        @user = User.new
        @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
        flash[:notice] = "パスワードが一致しません"
        render("posts/index")
      end
    else
      flash[:notice] = "パスワードを入力してください"
      redirect_to("/")
    end
  end

  def provider_create
    @user = User.find_or_create_account(request.env['omniauth.auth'])
    session[:login_user_id] = @user.id
    flash[:notice] = "#{@user.name}でログインしました。"
    redirect_to("/")
  end

  def provider_fail
    flash[:notice] = "ログインに失敗しました。"
    redirect_to("/")
  end

  def destroy
    user = User.find_by(id: params[:id])
    posts = Post.where(user_id: user.id)
    posts.each do |p|
      p.destroy
    end
    user.destroy
    redirect_to("/")
  end

  def update
    if params[:password] #パスワードに入力がある時
      if params[:password] == params[:password_confirmation]
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        if params[:avatar] #イメージ画像を編集するとき
          write_image(params[:avatar])
          if @user.save #処理が正常に行ったとき
            flash[:notice] = "#{@user.name}の情報を編集しました。"
            redirect_to("/")
          else #処理が正常に行かなかったとき
            @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
            flash[:notice] = "ユーザー編集に失敗しました。"
            render("posts/index")
          end
        else #イメージ画像の編集がない場合
          if @user.save #処理が正常に行ったとき
            flash[:notice] = "#{@user.name}の情報を編集しました。"
            redirect_to("/")
          else #処理が正常に行かなかったとき
            @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
            flash[:notice] = "ユーザー編集に失敗しました。"
            render("posts/index")
          end
        end
      else #password_confirmationに問題があったとき
        @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
        flash[:notice] = "パスワードが一致しません"
        render("posts/index")
      end
    else #パスワードの編集をしないとき
      if params[:avatar] #イメージ画像を編集するとき
        write_image(params[:avatar])
        user.update(
          name: params[:name],
          email: params[:email]
        )
        if @user.save #処理が正常に行ったとき
          flash[:notice] = "#{@user.name}の情報を編集しました。"
          redirect_to("/")
        else #処理が正常に行かなかったとき
          @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
          flash[:notice] = "ユーザー編集に失敗しました。"
          render("posts/index")
        end
      else #イメージ画像の編集がない場合
        @user.update(
          name: params[:name],
          email: params[:email]
        )
        if @user.save #処理が正常に行ったとき
          flash[:notice] = "#{@user.name}の情報を編集しました。"
          redirect_to("/")
        else #処理が正常に行かなかったとき
          @posts = Post.all.order(id: "desc").page(params[:page]).per(15)
          flash[:notice] = "ユーザー編集に失敗しました。"
          render("posts/index")
        end
      end
    end
  end

  def login
    user = User.find_by(email: params[:login_email])
    if user && user.authenticate(params[:login_password])
      session[:login_user_id] = user.id
      flash[:notice] = "#{user.name}でログインしました。"
      redirect_to("/")
    else
      flash[:notice] = "ログイン情報が間違っています。"
      redirect_to("/")
    end
  end

  def logout
    session[:login_user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/")
  end

  def new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def login_form
  end

  private
  def user_params
    params.permit(:name, :password, :email)
  end

  def write_image(params)
    @user.image = nil
    @user.avatar.attach(params)
  end

end
