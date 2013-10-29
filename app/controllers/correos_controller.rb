class CorreosController < ApplicationController
  # POST /reports.json
  def create
    @correo = Correo.new(params[:correo])

    respond_to do |format|
      if @correo.save
        format.html { redirect_to @correo, notice: 'correo was successfully created.' }
    	end	
    end
  end
    def show

    @report = Correo.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end
end
