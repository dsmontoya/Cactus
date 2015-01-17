module Api
  module V1
    class TeamsController < ApiController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /users
  # GET /users.json
  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true)
      render :json => @teams
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @team = team.new
  end

  # GET /users/1/edit
  def edit
  end


  # POST /users
  # POST /users.json
  def create
    @team = team.new(user_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @team.update(user_params)
       head :ok 
      else
       head :error 
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      team_params = params.require(:team).permit(:teammates => [])
    end
end

end
end
