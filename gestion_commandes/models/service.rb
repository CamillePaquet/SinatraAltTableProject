module Sample
    module Models
      class Service
        include Mongoid::Document
  
        field :plan_table, :type => Array
        field :date, :type => String


      end
    end
  end