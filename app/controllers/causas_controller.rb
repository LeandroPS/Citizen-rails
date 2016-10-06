class CausasController < ApplicationController
	before_action :authenticate_user!
  before_action :set_causa, only: [:show, :edit, :update, :destroy]

  # GET /causas
  # GET /causas.json
  def index
		@cidades = Cidade.all
		@ccidade = params[:ccidade]
		filtro = "1=1"
		
		if @ccidade != nil
			filtro = filtro+" and cidade_id = '"+@ccidade+"'"
		end
		
		@causas = Causa.where(filtro).order("titulo").paginate(page:
params[:page], per_page: 3)
		
		
    #@causas = Causa.all
  end
	
	def listar
		@causas = Causa.all.paginate(page: params[:page], per_page: 10)
		respond_to do |format|
			format.html
			format.pdf do
				pdf = CausasReport.new(@causas)
				send_data pdf.render, filename: 'CausasListagem.pdf', :width =>
				pdf.bounds.width, type: 'application/pdf', disposition: :inline, :page_size => "A4", :page_layout => :portrait
			end
		end
 	end

  # GET /causas/1
  # GET /causas/1.json
  def show
  end

  # GET /causas/new
  def new
    @causa = Causa.new
  end

  # GET /causas/1/edit
  def edit
  end

  # POST /causas
  # POST /causas.json
  def create
    @causa = Causa.new(causa_params)
		@causa.user_id = current_user.id

    respond_to do |format|
      if @causa.save
        format.html { redirect_to @causa, notice: 'Causa was successfully created.' }
        format.json { render :show, status: :created, location: @causa }
      else
        format.html { render :new }
        format.json { render json: @causa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /causas/1
  # PATCH/PUT /causas/1.json
  def update
    respond_to do |format|
      if @causa.update(causa_params)
        format.html { redirect_to @causa, notice: 'Causa was successfully updated.' }
        format.json { render :show, status: :ok, location: @causa }
      else
        format.html { render :edit }
        format.json { render json: @causa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causas/1
  # DELETE /causas/1.json
  def destroy
    @causa.destroy
    respond_to do |format|
      format.html { redirect_to causas_url, notice: 'Causa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_causa
      @causa = Causa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def causa_params
      params.require(:causa).permit(:titulo, :descricao, :user_id, :foto, :cidade_id)
    end
end
