class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)
      if @form.save
        @team = Team.create(:teammates => params['team']["teammates"].to_a)
        @form.update_attributes(:team_id => @team.id)
        User.find(current_user.id).update_attributes(:team_id => @team.id)
        flash[:success] = "Form Submitted"
        redirect_to :back
      else
        flash[:error] = "Something went wrong"
        redirect_to :new_submission
      end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:project, :first_hackathon, :why, :how_did_you_hear_about_us,
                                                 :proficiencies, :sponsor_you_want_to_see, :what_do_you_want_to_learn,
                                                 :shirt_size, :dietary_restrictions, :code_of_conduct_read, :team_id,
                                                 :interests, :team_id, :team_attributes => [:teammates])
    end
end

