class Restaurant
    attr_accessor :nom
    attr_accessor :plant_table_actif
    
    def initialize(nom)
        nom ? @nom = nom : @nom=nil
        @plan_table_nom = nil
    end

end