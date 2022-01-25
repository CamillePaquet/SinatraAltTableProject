require "test/unit"
require_relative "../service_Service"
require_relative "../service"

include Sample::Services

class MockServiceRepertoire
    def initialize options = {}
    options[:restaurant_existe_par_nom] ? @restaurant_existe_par_nom = options[:restaurant_existe_par_nom] : @restaurant_existe_par_nom=nil
    options[:restaurant_a_un_plan_de_table] ? @restaurant_a_un_plan_de_table = options[:restaurant_a_un_plan_de_table] : @restaurant_a_un_plan_de_table=nil
    options[:restaurant_a_un_service] ? @restaurant_a_un_service = options[:restaurant_a_un_service] : @restaurant_a_un_service=nil
    options[:recuperation_plan_table_actif_restaurant] ? @recuperation_plan_table_actif_restaurant = options[:recuperation_plan_table_actif_restaurant] : @recuperation_plan_table_actif_restaurant=nil
    options[:recuperation_plan_table_service] ? @recuperation_plan_table_service = options[:recuperation_plan_table_service] : @recuperation_plan_table_service=nil
    options[:creation_service_repertoire] ? @creation_service_repertoire = options[:creation_service_repertoire] : @creation_service_repertoire=nil
    options[:ajout_clients_repertoir] ? @ajout_clients_repertoir = options[:ajout_clients_repertoir] : @ajout_clients_repertoir=nil
    end
  
  def restaurant_existe_par_nom? nom
    return @restaurant_existe_par_nom
  end

  def restaurant_a_un_plan_de_table? restaurant
    return @restaurant_a_un_plan_de_table
  end

  def restaurant_a_un_service? nom_restaurant
    return @restaurant_a_un_service
  end

  def recuperation_plan_table_actif_restaurant nom
    return @recuperation_plan_table_actif_restaurant
  end

  def recuperation_plan_table_service nom
    return @recuperation_plan_table_service
  end

  def creation_service_repertoire options = {}             
    return @creation_service_repertoire
  end

  def ajout_clients_repertoir options = {}             
    return @ajout_clients_repertoir
  end

end

class TestNumber < Test::Unit::TestCase

    def test_clients_positifs?
        mockServiceRepertoire = MockServiceRepertoire.new({})
        service_service = ServiceService.new(mockServiceRepertoire)
        assert_equal(service_service.clients_positifs?(1), true)
        assert_equal(service_service.clients_positifs?(-1), false)
        assert_equal(service_service.clients_positifs?(0), false)
    end  

    def test_creation_service_service
        options = {
        :restaurant_existe_par_nom => true,
        :restaurant_a_un_plan_de_table => true,
        :recuperation_plan_table_actif_restaurant => [{
            :numero => 1,
            :convives => 3
        }],
        :creation_service_repertoire => "CREATED"
        }
        mockServiceRepertoire = MockServiceRepertoire.new(options)
        service_service = ServiceService.new(mockServiceRepertoire)
        assert_equal(service_service.creation_service_service("restaurant"), "CREATED")
    end

    def test_nombre_convives_inferieur_ou_egal_au_nombre_clients?
        verifications_clients = {
            :plan_table => [
                {
                    :numero => 1,
                    :convives =>2,
                    :clients => 0
                }
            ],
            :clients => 2,
            :numero => 1
        }
        mockServiceRepertoire = MockServiceRepertoire.new({})
        service_service = ServiceService.new(mockServiceRepertoire)
        assert_equal(service_service.nombre_convives_inferieur_ou_egal_au_nombre_clients?(verifications_clients), true)
        verifications_clients = {
            :plan_table => [
                {
                    :numero => 1,
                    :convives =>2,
                    :clients => 0
                }
            ],
            :clients => 4,
            :numero => 1
        }
        assert_equal(service_service.nombre_convives_inferieur_ou_egal_au_nombre_clients?(verifications_clients), false)
      end

  def test_clients_egal_zero
    plan_table = [
          {
              :numero => 1,
              :convives =>2,
              :clients => 0
          }
      ]
    mockServiceRepertoire = MockServiceRepertoire.new({})
    service_service = ServiceService.new(mockServiceRepertoire)
    assert_equal(service_service.clients_egal_zero(plan_table, 1), true)
    plan_table = [
            {
                :numero => 1,
                :convives =>2,
                :clients => 4
            }
        ]
    assert_equal(service_service.clients_egal_zero(plan_table, 1), false)
    assert_equal(service_service.clients_egal_zero(plan_table, 2), false)
  end

  def test_ajout_clients_plan_table
    verifications_clients = {
        :plan_table => [
            {
                :numero => 1,
                :convives =>2,
                :clients => 0
            }
        ],
        :clients => 2,
        :numero => 1
    }
    mockServiceRepertoire = MockServiceRepertoire.new({})
    service_service = ServiceService.new(mockServiceRepertoire)
    assert_equal(service_service.ajout_clients_plan_table(verifications_clients), [
        {
            :numero => 1,
            :convives =>2,
            :clients => 2
        }
    ])
  end

  def test_ajout_clients
    options = {
        :restaurant_existe_par_nom => true,
        :restaurant_a_un_service => true,
        :recuperation_plan_table_service => [{
            :numero => 1,
            :convives => 3,
            :clients => 0
        }],
        :ajout_clients_repertoir => "UPDATED"
      }
      options_service = {
          :nom_restaurant => "restaurant",
          :clients => 2,
          :numero_table => 1
      }
      mockServiceRepertoire = MockServiceRepertoire.new(options)
      service_service = ServiceService.new(mockServiceRepertoire)
      assert_equal(service_service.ajout_clients(options_service), "UPDATED")
  end

end