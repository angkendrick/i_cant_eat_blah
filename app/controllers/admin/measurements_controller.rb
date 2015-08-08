class Admin::MeasurementsController < ApplicationController

  def index
    @measurements = Measurement.all
  end

  def new
    @measurement = Measurement.new
  end

  def create
    @measurement = Measurement.new(secure_params)

    if @measurement.save
      redirect_to admin_measurements_path, notice: "Added #{@measurement.long_name}"
    else
      render :new
    end
  end

  def edit
    @measurement = Measurement.find(params[:id])
  end

  def update
    @measurement = Measurement.find(params[:id])
    @measurement.update(secure_params)

    if @measurement.save
      redirect_to admin_measurements_path, notice: "Updated #{@measurement.long_name}"
    else
      render :edit
    end
  end

  def destroy
    @measurement = Measurement.find(params[:id])

    if @measurement.destroy
      redirect_to admin_measurements_path, notice: "Deleted #{@measurement.long_name}"
    else
      render :index
    end
  end

  protected

  def secure_params
    params.require(:measurement).permit(:long_name, :short_name)
  end

end
