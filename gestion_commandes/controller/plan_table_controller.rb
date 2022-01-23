include Sample::Models
include Sample::Services
include Sample::Repository
include Sample::Helpers

Sample::Backend.namespace '/altTable/api' do

  post '/planTable' do
    body = request.body.read
    data = JSON.parse(body)
    tables_hash = Array.new
    data["tables"].each do |table|
      tables_hash << {
        :numero => table["numero"],
        :convives => table["convives"]
      }
    end
    attributs_plan_table = {
        :nom => data["nom"],
        :tables => tables_hash
    }
    plan_table = PlanTable.new(attributs_plan_table)
    repo = PlanTableRepository.new()
    plan_table_service = PlanTableService.new(repo)
    response = plan_table_service.creation_plan_table_service plan_table
    
    status STATUS_MAP[response][:status]
    return STATUS_MAP[response][:message]
  end



end