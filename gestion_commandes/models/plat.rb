module Sample
  module Models
    class Plat
      include Mongoid::Document

      field :nom, :type => String
      field :description, :type => String
      field :type, :type => String
      field :prix, :type => Integer
      field :quantite, :type => Integer

    end
  end
end
