include Sample::Models
include Sample::Services
include Sample::Repository
include Sample::Helpers

Sample::Backend.namespace '/altTable/api' do

  post '/planTable' do
    body = request.body.read
    data = JSON.parse(body)
    attributs_plan_table = {
        :nom => data["nom"],
        :tables => data["tables"]
    }
    plan_table = PlanTable.new(attributs_plan_table)
    repo = PlanTableRepository.new()
    plan_table_service = PlanTableService.new(repo)
    response = plan_table_service.creation_plan_table_service plan_table
    
    status STATUS_MAP[response][:status]
    return STATUS_MAP[response][:message]
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
    
    status STATUS_MAP[response][:status]
    return STATUS_MAP[response][:message]
  end

  get '/plats' do
    repo = PlatRepository.new()
    plat = PlatService.new(repo)
    response = plat.recuperation_liste_plats()
    if !STATUS_MAP.include? response then
      status STATUS_MAP["OK"][:status]
      return response.to_json
    else
      status STATUS_MAP[response][:status]
      return STATUS_MAP[response][:message]
    end
  
  end


end