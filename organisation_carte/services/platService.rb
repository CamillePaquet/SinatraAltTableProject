require_relative 'types/enum_type'
include Sample::Enum

module Sample
    module Services

        class PlatService
            
            def initialize repo
                @repo = repo
            end

            def type_correct? type
                TYPES.has_value?(type) ? true : false
            end

            def prix_correct_et_arrondir prix
                if prix.is_a?(Integer)
                    return prix.to_f
                elsif prix.is_a?(Float)
                    return prix.round(2)                 
                end
                return -1
            end

            def ajout_plat_service plat
                return "BAD_REQUEST" if !type_correct? plat.type 
                nouveau_prix = prix_correct_et_arrondir plat.prix
                if nouveau_prix  <0 then
                    return "BAD_REQUEST"
                else 
                    plat.prix = nouveau_prix
                end
                return "ALREADY_EXIST"if @repo.plat_existe_par_nom?(plat.nom)
                attributs_plat = {
                    :nom => plat.nom,
                    :description => plat.description,
                    :type => plat.type,
                    :prix => plat.prix.to_f,
                    :quantite => plat.quantite
                }
                return @repo.ajout_plat_repertoire attributs_plat
            end

            def modification_quantite_service plat
                return "NOTFOUND" if !@repo.plat_existe_par_nom?(plat.nom)
                attributs_plat = {
                    :nom => plat.nom,
                    :quantite => plat.quantite,
                }
                return @repo.modification_quantite_repertoire attributs_plat
            end

            def recuperation_liste_plats
                return @repo.recuperation_liste_plats_repertoire
            end

        end
    end
end
