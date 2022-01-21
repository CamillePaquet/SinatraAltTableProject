include Sample::Models
include Sample::Services
include Sample::Repository

Sample::Backend.namespace '/altTable/api' do

  get '/carte' do
    carteRepo = CarteRepository.new()
    carteService = CarteService.new(carteRepo)
    response = carteService.recuperation_plats_disponibles()
    if response == "" then
      status 400
      return response
    else
      status 200
      return response
    end
  end


end