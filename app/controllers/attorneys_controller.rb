class AttorneysController < ApplicationController
  before_action :authenticate_user!
  def index
    @attorneys = Attorney.all 
  end 

  def show
    @attorney = Attorney.find(params[:id])
  end 
  
  def new
    @attorney = Attorney.new 
    @attorney.address = "100 W. Randolph Street, 13th Floor, Chicago, IL 60601"
    @attorney.fax = "312-814-1154"
  end 

  def create
    @attorney = Attorney.new(attorney_params)
    respond_to do |format|
      if @attorney.save!
        format.html { redirect_to attorneys_path, notice: "attorney was successfully created." }
        format.json { render :show, status: created, location: @attorney }
      else
        format.html{ render :new }
        format.json { render json: @attorney.errors, status: :unprocessable_entity }
      end 
    end 
  end 

  def edit 
    @attorney = Attorney.find(params[:id])
  end 

  def update
    @attorney = Attorney.find(params[:id])
    @attorney.update!(attorney_params)
    redirect_to attorneys_path
  end 

  def destroy
    @attorney = Attorney.find(params[:id])
    @attorney.destroy!
    redirect_to attorneys_path
  end 

  private 

  def attorney_params
    params.require(:attorney).permit(:name, :address, :fax, :phone)
  end
end
