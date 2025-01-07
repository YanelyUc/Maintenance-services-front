class MaintenanceServicesController < ApplicationController
  def create
    response = RestClient.post("#{ROUTE_API}/api/v1/maintenance_services", maintenance_service_params.to_h)
    @service = JSON.parse(response.body)

    if response.succ
      redirect_to maintenance_service_path(id: @service['id']), notice: 'Servicio creado con éxito.'
    else
      render :new
    end
  rescue StandardError => e
    puts "Se produjo un error inesperado: #{e.message}"
  end

  def show
    response = RestClient.get("#{ROUTE_API}/api/v1/maintenance_services/#{maintenance_service_params['id']}")
    @service = JSON.parse(response.body)
  end

  def maintenance_service_params
    params.permit(:id, :description, :car_id, :status, :date, :filter_status)
  end
end
