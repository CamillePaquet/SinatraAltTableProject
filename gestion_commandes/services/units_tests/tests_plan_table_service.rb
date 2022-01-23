require "test/unit"
require_relative "../plan_table_Service"
require_relative "../plan_table"

include Sample::Services

class MockPlanTableRepertoire
    def initialize options = {}
      options[:plan_table_existe_par_nom] ? @plan_table_existe_par_nom = options[:plan_table_existe_par_nom] : @plan_table_existe_par_nom=nil
      options[:creation_plan_table] ? @creation_plan_table = options[:creation_plan_table] : @creation_plan_table=nil
    end
  
    def plan_table_existe_par_nom? nom
      return @plan_table_existe_par_nom
    end
  
    def creation_plan_table options = {}
        return @creation_plan_table
    end


end


class TestPlanTableService < Test::Unit::TestCase

    def test_convives_positifs_avec_nombre_positif
      mockPlanTableRepertoire = MockPlanTableRepertoire.new()
      plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
      assert_equal(plan_table_service.convives_positifs?(3), true)
    end 

    def test_convives_positifs_avec_nombre_negatif
        mockPlanTableRepertoire = MockPlanTableRepertoire.new()
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        assert_equal(plan_table_service.convives_positifs?(-3), false)
    end 

    def test_convives_positifs_avec_nombre_egal_zero
        mockPlanTableRepertoire = MockPlanTableRepertoire.new()
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        assert_equal(plan_table_service.convives_positifs?(0), false)
    end 

    def test_creation_plan_table_service_with_good_attributs
        options = {
            :plan_table_existe_par_nom => false,
            :creation_plan_table => "CREATED"
        }
        mockPlanTableRepertoire = MockPlanTableRepertoire.new(options)
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        plan_table_attributs = {
            "nom": "PlanTest",
            "tables":[
                {
                "numero": 1,
                "convives": 3
                },
                {
                "numero": 2,
                "convives": 7
                },
                {
                "numero": 3,
                "convives": 2
                }
            ]
        }
        plan_table = PlanTable.new(plan_table_attributs)
        assert_equal(plan_table_service.creation_plan_table_service(plan_table), "CREATED")
    end

    def test_creation_plan_table_service_avec_convives_negatif
        options = {
            :plan_table_existe_par_nom => false,
            :creation_plan_table => "BAD_REQUEST"
        }
        mockPlanTableRepertoire = MockPlanTableRepertoire.new(options)
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        plan_table_attributs = {
            "nom": "Plan 3",
            "tables":[
                {
            "numero": 1,
            "convives": -3
            },
            {
            "numero": 2,
            "convives": 7
            },
            {
            "numero": 3,
            "convives": 2
            }
            ]
        }
        plan_table = PlanTable.new(plan_table_attributs)
        assert_equal(plan_table_service.creation_plan_table_service(plan_table), "BAD_REQUEST")
    end

    def test_creation_plan_table_service_avec_convives_zero 
        options = {
            :plan_table_existe_par_nom => false,
            :creation_plan_table => "BAD_REQUEST"
        }
        mockPlanTableRepertoire = MockPlanTableRepertoire.new(options)
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        plan_table_attributs = {
            "nom": "Plan 3",
            "tables":[
                {
            "numero": 1,
            "convives": 0
            },
            {
            "numero": 2,
            "convives": 7
            },
            {
            "numero": 3,
            "convives": 2
            }
            ]
        }
        plan_table = PlanTable.new(plan_table_attributs)
        assert_equal(plan_table_service.creation_plan_table_service(plan_table), "BAD_REQUEST")
    end

    def test_creation_plan_table_service_avec_numero_duplique 
        options = {
            :plan_table_existe_par_nom => false,
            :creation_plan_table => "BAD_REQUEST"
        }
        mockPlanTableRepertoire = MockPlanTableRepertoire.new(options)
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        plan_table_attributs = {
            "nom": "Plan 3",
            "tables":[
                {
            "numero": 1,
            "convives": 3
            },
            {
            "numero": 1,
            "convives": 7
            },
            {
            "numero": 3,
            "convives": 2
            }
            ]
        }
        plan_table = PlanTable.new(plan_table_attributs)
        assert_equal(plan_table_service.creation_plan_table_service(plan_table), "BAD_REQUEST")
    end

    def test_creation_plan_table_service_avec_nom_existant
        options = {
            :plan_table_existe_par_nom => true,
            :creation_plan_table => "ALREADY_EXIST"
        }
        mockPlanTableRepertoire = MockPlanTableRepertoire.new(options)
        plan_table_service = PlanTableService.new(mockPlanTableRepertoire)
        plan_table_attributs = {
            "nom": "Plan 3",
            "tables":[
                {
            "numero": 1,
            "convives": 3
            },
            {
            "numero": 2,
            "convives": 7
            },
            {
            "numero": 3,
            "convives": 2
            }
            ]
        }
        plan_table = PlanTable.new(plan_table_attributs)
        assert_equal(plan_table_service.creation_plan_table_service(plan_table), "ALREADY_EXIST")
    end

end