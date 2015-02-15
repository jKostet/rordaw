class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @membership = Membership.new
  end

  # GET /memberships/new
  def new
    beer_clubs_without_current_user = BeerClub.all.select{ |x| not x.users.find_by username:current_user.username}
    @beer_clubs = beer_clubs_without_current_user
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json

  # def create
  #   @membership = Membership.new(membership_params)
  #   respond_to do |format|
  #     current_user.memberships << @membership
  #     if @membership.save
  #       format.html { redirect_to @membership.beer_club, notice:
  #                                                          "#{@membership.user.username} welcome to club" }
  #
  #       format.json { render :show, status: :created, location: @membership }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @membership.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    # membership_params[:user_id] = session[:user_id]
    @membership = Membership.new(membership_params)
    respond_to do |format|
      if @membership.save
        @beer_clubs = BeerClub.where id:@membership.beer_club_id
        @users = User.where id:@membership.user_id
        name = @users.first.username
        format.html { redirect_to @beer_clubs.first, notice: "#{name}, welcome to the club!" }
        format.json { render :show, status: :created, location: @membership }
      else
        @user_id = session[:user_id]
        @membership = Membership.new
        @beer_clubs = BeerClub.all
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    user = @membership.user
    beer_club = @membership.beer_club
    name = beer_club.name

    @membership.destroy
    respond_to do |format|
      format.html { redirect_to user, notice: "Membership in #{name} ended." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_membership
    @membership = Membership.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def membership_params
    params.require(:membership).permit(:beer_club_id, :user_id)
  end
end