class Restaurant
    attr_accessor :nom
    attr_accessor :plan_table_nom
    attr_accessor :service_date
    
    def initialize(nom)
        nom ? @nom = nom : @nom=nil
        @plan_table_nom = nil
        @service_date = nil
    end

end