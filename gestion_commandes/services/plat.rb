class Plat
    attr_accessor :nom, :type, :description, :prix, :quantite
    
    def initialize(options = {})
        options[:nom] ? @nom = options[:nom] : @nom=nil
        options[:description] ? @description = options[:description] : @description=nil
        options[:type] ? @type = options[:type] : @type=nil
        options[:prix] ? @prix = options[:prix] : @prix=nil
        options[:quantite] ? @quantite = options[:quantite] : @quantite=0
    end

end