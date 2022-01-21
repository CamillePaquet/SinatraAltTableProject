include Sample::Models
include Sample::Services
include Sample::Repository

Sample::Backend.namespace '/altTable/api' do

  get '/carte' do
    carteRepo = CarteRepository.new()
    carteService = CarteService.new(carteRepo)
    response = carteService.recuperation_plats_disponibles()
    if !STATUS_MAP.include? response then
      status STATUS_MAP["OK"][:status]
      return response.to_json
    else
      status STATUS_MAP[response][:status]
      return STATUS_MAP[response][:message]
    end
  end


end