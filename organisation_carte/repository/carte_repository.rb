require_relative 'i_carte_repository'
module Sample 
   
    module Repository

        class CarteRepository  < ICarteRepository

            def recuperation_liste_plats_dispo
                begin
                    return  Sample::Models::Plat.all.where(:quantite.gt => 0)
                end   
            end
        end
    end
end