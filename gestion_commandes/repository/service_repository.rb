require_relative 'i_restaurant_repository' 

module Sample 
   
    module Repository


        class ServiceRepository < IServiceRepository
            
            def restaurant_existe_par_nom? nom
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom)
                    return true
                rescue Mongoid::Errors::DocumentNotFound 
                    return false
                end
            end

            def restaurant_a_un_plan_de_table? nom
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom)
                    return restaurant.plan_table_nom != nil
                end
            end

            def restaurant_a_un_service? nom
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom)
                    return restaurant.service_date != nil
                end
            end

            def recuperation_plan_table_actif_restaurant nom
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom)
                    plan_table_nom = restaurant.plan_table_nom
                    plan_table = Sample::Models::PlanTable.find_by(nom: plan_table_nom)
                    return plan_table.tables
                end
            end

            def recuperation_plan_table_service nom
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom)
                    service_date = restaurant.service_date
                    service = Sample::Models::Service.find_by(date: service_date)
                    return service.plan_table
                end
            end
            
            def creation_service_repertoire options = {}                
                begin
                    service = Sample::Models::Service.create(
                        plan_table: options[:plan_table],
                        date: Time.now.to_s
                    )
                    restaurant = Sample::Models::Restaurant.find_by(nom: options[:nom_restaurant])
                    restaurant.update_attributes!(
                        service_date: service.date
                    )
                    restaurant.save!
                    return "CREATED"
                end
            end

            def ajout_clients_repertoir options = {}                
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: options[:nom])
                    service_date = restaurant.service_date
                    service = Sample::Models::Service.find_by(date: service_date)
                    service.update_attributes!(
                        plan_table: options[:plan_table]
                    )
                    service.save!
                    return "UPDATED"
                end
            end
            
        end
    end
end