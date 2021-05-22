class CalculationsController < ApplicationController

  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @calculations = Calculation.all
    respond_to do |format|
      format.json {
        render json: @calculations.to_json
      }
      format.xml {
        render xml: @calculations.to_xml
      }
      format.html {
        render 'index'
      }
    end
  end

  def show
    @calculation = Calculation.find(params[:id])
  end

  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.new(calculation_params)
    if @calculation.save
      flash[:success] = "Successfully created!"
      redirect_to calculation_path(@calculation)
    else
      flash[:error] = "could not create!"
      render 'new'
    end
  end

  def edit
    @calculation = Calculation.find(params[:id])
  end

  def update
    @calculation = Calculation.find(params[:id])
    if @calculation.update(calculation_params)
      redirect_to calculation_path(@calculation)
      flash[:success] = "Successfully updated!"
    else
      flash[:error] = "could not update"
      render 'edit'
    end
  end

  def destroy
    @calculation = Calculation.find(params[:id])
    @calculation.destroy
    redirect_to calculations_path
  end

  private def calculation_params
    params.require(:calculation).
      permit(:argument1, :operand, :argument2, :title, :category_id)
  end
end
