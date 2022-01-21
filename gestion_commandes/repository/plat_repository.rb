require_relative 'i_plat_repository'

module Sample 
   
    module Repository

        class PlatRepository < IPlatRepository

            def plat_existe_par_nom? nom
                begin
                    plat = Sample::Models::Plat.find_by(nom: nom)
                    return true
                rescue Mongoid::Errors::DocumentNotFound 
                    puts "Ce plat n'existe pas dans la base de donnée"
                    return false
                rescue Mongo::Error::NoServerAvailable
                    STDERR.puts "Le base de données n'est pas disponible"
                    return false
                rescue Exception => e
                    STDERR.puts "plat_existe_par_nom :"+e
                    return false
                end
            end

            def ajout_plat_repertoire options = {}
                begin
                    Sample::Models::Plat.create(
                        nom: options[:nom],
                        description: options[:description],
                        type: options[:type],
                        prix: options[:prix],
                        quantite: options[:quantite]
                    )
                    plat = Sample::Models::Plat.find_by(nom: options[:nom])
                    return plat.id
                rescue Mongoid::Errors::DocumentNotFound 
                    STDERR.puts "Erreur lors de la creation du plat"
                    return false
                rescue Mongo::Error::NoServerAvailable
                    STDERR.puts "Le base de données n'est pas disponible"
                    return false
                rescue Exception => e
                    STDERR.puts "ajout_plat_repertoire :"+e
                    return false
                end
            end

            def plat_par_nom nom
                begin
                    return Sample::Models::Plat.find_by(nom: nom)
                rescue Mongoid::Errors::DocumentNotFound 
                    STDERR.puts "Ce plat n'existe pas dans la base de donnée"
                rescue Mongo::Error::NoServerAvailable
                    STDERR.puts "Le base de données n'est pas disponible"
                rescue Exception => e
                    STDERR.puts "plat_existe_par_nom :"+e
                end
            end

            def modification_quantite_repertoire options = {}
                plat = plat_par_nom options[:nom]
                plat.update_attributes!(
                    quantite: options[:quantite]
                )
                plat.save!
                return plat.id
            end

            def recuperation_liste_plats_repertoire
                begin
                    return Sample::Models::Plat.all.to_json
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