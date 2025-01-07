class CarsController < ApplicationController
  def index
    response = RestClient.get("#{ROUTE_API}/api/v1/cars", { params: car_params.to_h })
    @cars = JSON.parse(response.body)['data']
  end

  def show
    response = RestClient.get("#{ROUTE_API}/api/v1/cars/#{car_params['id']}")
    @car = JSON.parse(response.body)
  end

  def edit
    response = RestClient.get("#{ROUTE_API}/api/v1/cars/#{car_params['id']}")
    @car = JSON.parse(response.body)
  end

  def update
    response = RestClient.patch("#{ROUTE_API}/api/v1/cars/#{car_params['id']}", car_params.to_h)
    @car = JSON.parse(response.body)

    if response.succ
      redirect_to @car, notice: 'Coche actualizado con éxito.'
    else
      render :edit
    end
  rescue StandardError => e
    puts "Se produjo un error inesperado: #{e.message}"
  end

  def create
    response = RestClient.post("#{ROUTE_API}/api/v1/cars", car_params.to_h)
    @car = JSON.parse(response.body)

    if response.succ
      redirect_to @car, notice: 'Coche creado con éxito.'
    else
      render :new
    end
  rescue StandardError => e
    puts "Se produjo un error inesperado: #{e.message}"
  end

  def destroy
    response = RestClient.delete("#{ROUTE_API}/api/v1/cars/#{car_params['id']}")
    if response.succ
      redirect_to @car, notice: 'Coche creado con éxito.'
    else
      render :new
    end
  rescue StandardError => e
    puts "Se produjo un error inesperado: #{e.message}"
  end

  def car_params
    params.permit(:id, :plate_number, :model, :year, :filter_status, :active)
  end
end
