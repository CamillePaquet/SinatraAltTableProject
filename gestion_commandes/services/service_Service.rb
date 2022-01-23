require_relative 'types/enum_type'
include Sample::Enum

module Sample
    module Services

        class ServiceService
            
            def initialize repo
                @repo = repo
            end

            def convives_positifs? convives
                if convives.is_a?(Integer) and convives > 0 then
                    return true
                end
                return false
            end

            def creation_service_service nom_restaurant
                return "NOT_FOUND" if @repo

                plan_table.tables.each_with_index do |table, index|
                    return "BAD_REQUEST" if !convives_positifs? table["convives"]
                    cpt_numeros = 0
                    plan_table.tables.each{|value| cpt_numeros+=1 if value["numero"] == table["numero"]}
                    return "BAD_REQUEST" if cpt_numeros > 1
                    return "ALREADY_EXIST"if @repo.plan_table_existe_par_nom?(plan_table.nom)
                end
                attributs_plan_table = {
                    :nom => plan_table.nom,
                    :tables => plan_table.tables
                }
                return @repo.creation_plan_table attributs_plan_table
            end

            def modification_quantite_service plat
                return "NOT_FOUND" if !@repo.plat_existe_par_nom?(plat.nom)
                attributs_plat = {
                    :nom => plat.nom,
                    :quantite => plat.quantite,
                }
                return @repo.modification_quantite_repertoire attributs_plat
            end

        end
    end
end