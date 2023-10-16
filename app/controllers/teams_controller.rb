class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def import_teams
    imported_file = params[:file]
    xlsx_file = Roo::Spreadsheet.open(imported_file)
    headers = xlsx_file.row(1) # get header row
    xlsx_file.each_with_index do |row, idx|
      next if idx == 0 # skip header
      # create hash from headers and cells
      team_data = Hash[[headers, row].transpose]
      team= Team.create(name: team_data["Equipo "])
      team.username = team.name.split(" ").join("").downcase
      team.password = team.username+"*#"
      team.save!
      e1= team.team_members.create(name: team_data["Estudiante 1"]) 
      e2= team.team_members.create(name: team_data["Estudiante 2"])
      e3= team.team_members.create(name: team_data["Estudiante 3"])
    end 
    redirect_to teams_path, notice: "Importados con éxito"
  end
  def documents
    @teams = Team.all
    respond_to do |format|
      format.pdf
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name)
    end
end
