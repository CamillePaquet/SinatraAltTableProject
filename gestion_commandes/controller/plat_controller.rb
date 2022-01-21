include Sample::Models
include Sample::Services
include Sample::Repository

Sample::Backend.namespace '/altTable/api' do

  post '/plats' do
    body = request.body.read
    data = JSON.parse(body)
    attributs_plat = {
      :nom => data["nom"],
      :description => data["description"],
      :type => data["type"],
      :prix => data["prix"]
    }
    plat = Plat.new(attributs_plat)
    repo = PlatRepository.new()
    platService = PlatService.new(repo)
    response = platService.ajout_plat_service plat
    if response == "Le plat existe déjà" || response == "Ce type de plat n'existe pas" then
      status 400
      return response
    else
      status 201
      return response
    end
  end

  patch '/plats/:nomPlat/quantite' do |nomPlat|
    body = request.body.read
    data = JSON.parse(body)
    repo = PlatRepository.new()
      attributs_plat = {
        :nom => nomPlat,
        :quantite => data["quantite"]
      }
    plat = Plat.new(attributs_plat)
    platService = PlatService.new(repo)
    response = platService.modification_quantite_service(plat)
    if response == "Ce plat n'existe pas" then
      status 400
      return response
    else
      status 201
      return response
    end
  end

  get '/plats' do
    repo = PlatRepository.new()
    plat = PlatService.new(repo)
    response = plat.recuperation_liste_plats()
    if response == "Ce plat n'existe pas" then
      status 400
      return response
    else
      status 200
      return response
    end
  end

end