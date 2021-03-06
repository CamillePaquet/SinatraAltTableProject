require_relative 'types/enum_type'
include Sample::Enum

module Sample
    module Services

        class PlanTableService
            
            def initialize repo
                @repo = repo
            end

            def convives_positifs? convives
                if convives.is_a?(Integer) and convives > 0 then
                    return true
                end
                return false
            end

            def creation_plan_table_service plan_table
                plan_table.tables.each_with_index do |table, index|
                    return "BAD_REQUEST" if !convives_positifs? table[:convives]
                    cpt_numeros = 0
                    plan_table.tables.each{|value| cpt_numeros+=1 if value["numero"] == table[:numero]}
                    return "BAD_REQUEST" if cpt_numeros > 1
                    return "ALREADY_EXIST"if @repo.plan_table_existe_par_nom?(plan_table.nom)
                end
                attributs_plan_table = {
                    :nom => plan_table.nom,
                    :tables => plan_table.tables
                }
                return @repo.creation_plan_table attributs_plan_table
            end

        end
    end
end
