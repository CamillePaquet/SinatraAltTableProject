module Sample
    module Helpers

        STATUS_MAP = {
            "BAD_REQUEST" => {
                :status => 400,
                :message => "La requête est incorrect"
            },
            "ALREADY_EXIST" => {
                :status => 400,
                :message => "Cette donnée existe déjà."
            },
            "CREATED" => {
                :status => 201,
                :message => "Cette donnée a bien été crée."
            },
            "UPDATED" => {
                :status => 200,
                :message => "La donnée a bien été modifiée."
            },
            "NOTFOUND" => {
                :status => 404,
                :message => "La donnée n'a pas été trouvée."
            },
            "OK" => {
                :status => 200,
                :message => "La donnée n'a pas été trouvée."
            }
        }

    end
end