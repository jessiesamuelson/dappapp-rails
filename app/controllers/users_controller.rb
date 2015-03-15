class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def current_user
    @current_user ||= session[:user_id] ? User.find_by_id(session[:user_id]) : nil
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "You have been logged in"
    else
      render :new, notice: 'Invalid Login'
    end
  end

  def logout
    reset_session
    redirect_to new_user_path, notice: 'You have been logged out'
  end
  
  def twitter_login
    if current_user && current_user.oauth_token
      redirect_to "/users/#{current_user.id}"
    else  
      session[:twitter_request_token] = twitter_accessor.get_request_token 
      redirect_to session[:twitter_request_token].authorize_url
    end

  end

  def twitter_callback
    request_token = session[:twitter_request_token]
    access_token = twitter_accessor.authorize(request_token, params[:oauth_verifier])
    
    current_user.oauth_token = access_token.token
    current_user.oauth_secret = access_token.secret

    current_user.save!

    redirect_to "/users/#{current_user.id}"

    # Pry.start(binding)

    # access_token = twitter_accessor.client.authorize(
    #   session[:twitter_request_token]['token'],
    #   session[:twitter_request_token]['secret'],
    #   :oauth_verifier => params[:oauth_verifier]
    # )
    # current_user.oauth_token = params[:oauth_token]
    # current_user.oauth_verifier = params[:oauth_verifier]
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = current_user
    # @tweets = @user.get_tweets
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :username, :company, :oauth_token, :oauth_secret, :password, :password_confirmation)
    end
end
