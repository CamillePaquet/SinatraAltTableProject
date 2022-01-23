module Sample
  module Models
    class PlanTable
      include Mongoid::Document

      field :nom, :type => String
      field :tables, :type => Array

    end
  end
end
