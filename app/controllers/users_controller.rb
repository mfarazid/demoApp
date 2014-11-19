class UsersController < ApplicationController
  before_action :set_user, only: [:new_user,:show, :edit, :update, :destroy]
  # Add new user
  def new_user
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      # format.html # show.html.haml
      format.js # show.js.haml
      format.json { render json: @user}
    end    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    respond_to do |format|
      format.js # edit.js.haml
      format.json { render json: @user}
    end 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        toast('success','User was successfully created!')
        format.html { redirect_to @user }
        format.json { render action: 'show', status: :created, location: @user }
        format.js   { render action: 'new_user', status: :created, location: @user } 
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js   { render json: @user.errors, status: :unprocessable_entity }  
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        toast('success','User was successfully updated!')
        format.html { redirect_to users_url }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      toast('success','User was successfully removed!')
      format.html { redirect_to users_url }
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
      params.require(:user).permit(:first_name, :last_name, :email, :birth_date, :role_ids => [])
    end
end
