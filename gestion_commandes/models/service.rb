module Sample
    module Models
      class Service
        include Mongoid::Document
  
        field :nom, :type => String
        field :plan_table_nom, :type => String


      end
    end
  end