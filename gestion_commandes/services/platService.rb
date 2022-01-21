require_relative 'types/enum_type'
include Sample::Enum

module Sample
    module Services

        class PlatService
            
            def initialize(repo)
                @repo = repo
            end

            def type_correct? (type)
                TYPES.has_value?(type) ? true : false
            end

            def ajout_plat_service(plat)
                return "Ce type de plat n'existe pas" if !type_correct? plat.type
                return "Le plat existe déjà" if @repo.plat_existe_par_nom? plat.nom
                attributs_plat = {
                    :nom => plat.nom,
                    :description => plat.description,
                    :type => plat.type,
                    :prix => plat.prix,
                    :quantite => plat.quantite
                }
                id_plat = @repo.ajout_plat_repertoire attributs_plat
                return id_plat
            end

            def modification_quantite_service (plat)
                return "Ce plat n'existe pas" if !@repo.plat_existe_par_nom? plat.nom 
                attributs_plat = {
                    :nom => plat.nom,
                    :quantite => plat.quantite,
                }
                id_plat = @repo.modification_quantite_repertoire attributs_plat
                return id_plat
            end

            def recuperation_liste_plats()
                return @repo.recuperation_liste_plats_repertoire
            end

        end
    end
end
