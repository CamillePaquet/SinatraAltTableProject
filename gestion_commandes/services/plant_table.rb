class PlanTable
    attr_accessor :tables, :nom
    
    def initialize(options = {})
        options[:tables] ? @tables = options[:tables] : @tables=nil
        options[:nom] ? @nom = options[:nom] : @nom=nil
    end

end