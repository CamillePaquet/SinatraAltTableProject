require_relative 'i_plan_table_repository'

module Sample 
   
    module Repository


        class PlanTableRepository < IPlanTableRepository

            def creation_plan_table options = {}
                begin
                    Sample::Models::PlanTable.create(
                        nom: options[:nom],
                        tables: options[:tables]
                    )
                    return "CREATED"
                end
            end


            def plan_table_existe_par_nom? nom
                begin
                    plant_table = Sample::Models::PlanTable.find_by(nom: nom)
                    return true
                rescue Mongoid::Errors::DocumentNotFound 
                    return false
                end
            end

        end
    end
end