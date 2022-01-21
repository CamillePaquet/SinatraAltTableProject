module Sample 
   
    module Repository

        class CarteRepository 

            def recuperation_liste_plats_dispo
                begin
                    return Sample::Models::Plat.all.where(:quantite.gt => 0).to_json
                rescue Mongoid::Errors::DocumentNotFound 
                    STDERR.puts "Pas de plat dans la base de donnée"
                rescue Mongo::Error::NoServerAvailable
                    STDERR.puts "Le base de données n'est pas disponible"
                rescue Exception => e
                    STDERR.puts "plat_existe_par_nom :"+e
                end
            end
        end
    end
end