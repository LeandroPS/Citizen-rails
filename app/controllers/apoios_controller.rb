class ApoiosController < ApplicationController
	before_action :set_causa, only: [:index, :create, :new]
  before_action :set_apoio, only: [:show, :edit, :update, :destroy]

  # GET /apoios
  # GET /apoios.json
  def index
    @apoios = Apoio.all
  end
	
	def set_causa
		@causa = Causa.find(params[:id])
	end

  # GET /apoios/1
  # GET /apoios/1.json
  def show
  end

  # GET /apoios/new
  def new
    @apoio = Apoio.new
  end

  # GET /apoios/1/edit
  def edit
  end

  # POST /apoios
  # POST /apoios.json
  def create
    @apoio = Apoio.new(apoio_params)
		
		@apoio.user_id = current_user.id
		@apoio.causa_id = @causa.id
		
		@apoio.save
		
		redirect_to @causa
    #respond_to do |format|
    #  if @apoio.save
    #    format.html { redirect_to @apoio, notice: 'Apoio was successfully created.' }
    #    format.json { render :show, status: :created, location: @apoio }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @apoio.errors, status: :unprocessable_entity }
    #  end
    end
  end

  # PATCH/PUT /apoios/1
  # PATCH/PUT /apoios/1.json
  def update
    respond_to do |format|
      if @apoio.update(apoio_params)
        format.html { redirect_to @apoio, notice: 'Apoio was successfully updated.' }
        format.json { render :show, status: :ok, location: @apoio }
      else
        format.html { render :edit }
        format.json { render json: @apoio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apoios/1
  # DELETE /apoios/1.json
  def destroy
    @apoio.destroy
    respond_to do |format|
      format.html { redirect_to apoios_url, notice: 'Apoio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apoio
      @apoio = Apoio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apoio_params
      params.require(:apoio).permit(:user_id, :causa_id)
    end
end
