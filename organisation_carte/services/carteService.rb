require_relative 'types/enum_type'
include Sample::Enum

module Sample
    module Services

        class CarteService
            def initialize(repo)
                @repo = repo
            end

            def recuperation_plats_disponibles()  
                return @repo.recuperation_liste_plats_dispo
            end
            
        end
    end
end
