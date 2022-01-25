

module Sample
    module Services

        class RestaurantService
            def initialize repo
                @repo = repo
            end
            
            def creation_restaurant_service restaurant
                return "ALREADY_EXIST"if @repo.restaurant_existe_par_nom?(restaurant.nom)
                attributs_restaurant = {
                    :nom => restaurant.nom
                }
                return @repo.creation_restaurant_repertoire attributs_restaurant
            end

            def modification_plan_de_table restaurant, nom_plan_table
                return "NOTFOUND"if !@repo.restaurant_existe_par_nom?(restaurant.nom)
                return "NOTFOUND"if !@repo.plan_table_existe_par_nom?(nom_plan_table)                
                return @repo.modification_plan_table_repertoire(restaurant.nom,nom_plan_table)
            end
        end
    end
end
