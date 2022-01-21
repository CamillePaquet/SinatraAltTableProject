require_relative 'i_plat_repository'

module Sample 
   
    module Repository


        class PlatRepository < IPlatRepository

            def plat_existe_par_nom? nom
                begin
                    plat = Sample::Models::Plat.find_by(nom: nom)
                    return true
                rescue Mongoid::Errors::DocumentNotFound 
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
                    return "CREATED"
                end
            end

            def plat_par_nom nom
                begin
                    plat = Sample::Models::Plat.find_by(nom: nom)
                    return plat  
                rescue Mongoid::Errors::DocumentNotFound 
                    return "NOT_FOUND"
                end
            end

            def modification_quantite_repertoire options = {}
                begin
                    plat = Sample::Models::Plat.find_by(nom: options[:nom])
                    plat.update_attributes!(
                        quantite: options[:quantite]
                    )
                    plat.save!
                    return "UPDATED"
                rescue Mongoid::Errors::DocumentNotFound 
                    return "NOT_FOUND"
                end
            end

            def recuperation_liste_plats_repertoire
                begin
                    return Sample::Models::Plat.all
                    
                end
            end
        end
    end
end