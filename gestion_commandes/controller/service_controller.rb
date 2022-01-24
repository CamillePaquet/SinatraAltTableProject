include Sample::Models
include Sample::Services
include Sample::Repository

Sample::Backend.namespace '/altTable/api' do

  post '/service/:nomRestaurant' do |nomRestaurant|
    body = request.body.read
    service = Service.new()
    repo = ServiceRepository.new()
    service_service = ServiceService.new(repo)
    response = service_service.creation_service_service nomRestaurant
    status STATUS_MAP[response][:status]
    return STATUS_MAP[response][:message]
  end

  patch '/service/:nomRestaurant' do |nomRestaurant|
    body = request.body.read
    data = JSON.parse(body)
    attributs_services = {
        :clients => data["clients"],
        :numero_table => data["numero_table"],
        :nom_restaurant => nomRestaurant
    }
    repo = ServiceRepository.new()
    service = Service.new()
    serviceService = ServiceService.new(repo)
    response = serviceService.ajout_clients(attributs_services)
    status STATUS_MAP[response][:status]
    return STATUS_MAP[response][:message]
  end


end