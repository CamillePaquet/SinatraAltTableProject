module Sample
    module Models
      class Restaurant
        include Mongoid::Document
  
        field :nom, :type => String
        field :plan_table_nom, :type => String
        field :service_date, :type => String

       

      end
    end
  end