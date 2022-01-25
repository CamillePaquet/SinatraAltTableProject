require_relative 'i_restaurant_repository' 

module Sample 
   
    module Repository


        class RestaurantRepository < IRestaurantRepository
            
            def restaurant_existe_par_nom? nom
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom)
                    return true
                rescue Mongoid::Errors::DocumentNotFound 
                    return false
                end
            end
            
            def creation_restaurant_repertoire options = {}
                begin
                    Sample::Models::Restaurant.create(
                        nom: options[:nom],
                        plan_table_nom: nil
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


            def modification_plan_table_repertoire nom_restaurant, nom_plan_table
                begin
                    restaurant = Sample::Models::Restaurant.find_by(nom: nom_restaurant)
                    plan_table = Sample::Models::PlanTable.find_by(nom: nom_plan_table)
                    restaurant.update_attributes!(
                        plan_table_nom: plan_table.nom
                    )
                    restaurant.save!
                    return "UPDATED"
                rescue Mongoid::Errors::DocumentNotFound 
                    return "NOTFOUND"
                end
            end
        end
    end
end