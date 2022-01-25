require_relative 'types/enum_type'
include Sample::Enum

module Sample
    module Services

        class ServiceService
            
            def initialize repo
                @repo = repo
            end

            def clients_positifs? clients
                if clients.is_a?(Integer) and clients > 0 then
                    return true
                end
                return false           
            end

            def creation_service_service nom_restaurant
                return "NOTFOUND" if !@repo.restaurant_existe_par_nom? nom_restaurant
                return "BAD_REQUEST" if !@repo.restaurant_a_un_plan_de_table? nom_restaurant
                plan_table = @repo.recuperation_plan_table_actif_restaurant nom_restaurant
                plan_table_array = Array.new
                plan_table.each do |plan|
                    plan_table_array << {
                        :numero => plan["numero"],
                        :convives => plan["convives"],
                        :clients => 0
                    }
                end
                options = {
                    :plan_table => plan_table_array,
                    :nom_restaurant => nom_restaurant
                }
                return @repo.creation_service_repertoire options
            end

            def nombre_convives_inferieur_ou_egal_au_nombre_clients? options = {}
                options[:plan_table].each do |table|
                    if table[:numero] == options[:numero] then
                        return false if table[:convives] < options[:clients]
                    end
                end
                return true
            end

            def clients_egal_zero plan_table, numero
                plan_table.each do |table|
                    if table[:numero] == numero then
                        return true if table[:clients] == 0
                    end
                end
                return false
            end

            def ajout_clients_plan_table options = {}
                options[:plan_table].each do |table|
                    if table[:numero] == options[:numero] then
                        table[:clients] = options[:clients]
                    end
                end
                return options[:plan_table]
            end

            def ajout_clients options = {}
                return "NOT_FOUND" if !@repo.restaurant_existe_par_nom? options[:nom_restaurant]
                return "BAD_REQUEST" if !@repo.restaurant_a_un_service? options[:nom_restaurant]
                plan_table = @repo.recuperation_plan_table_service options[:nom_restaurant]
                return "BAD_REQUEST" if !clients_positifs? options[:clients]
                
                return "BAD_REQUEST" if !clients_egal_zero plan_table, options[:numero_table]
               
                verifications_clients = {
                    :plan_table => plan_table,
                    :clients => options[:clients],
                    :numero => options[:numero_table]
                }
                return "BAD_REQUEST" if !nombre_convives_inferieur_ou_egal_au_nombre_clients? verifications_clients

                updated_plan_table = ajout_clients_plan_table verifications_clients
                update = {
                    nom: options[:nom_restaurant],
                    plan_table: updated_plan_table
                }
                return @repo.ajout_clients_repertoir update
            end



        end
    end
end

