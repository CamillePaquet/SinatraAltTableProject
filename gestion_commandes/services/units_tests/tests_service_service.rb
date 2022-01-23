# require "test/unit"
# require_relative "../restaurantService"
# require_relative "../restaurant"
# require_relative "../../repository/restaurant_repository"

# include Sample::Services
# include Sample::Repository

# class MockRestaurantRepertoire
#   def initialize options = {}
#     options[:restaurant_existe_par_nom] ? @restaurant_existe_par_nom = options[:restaurant_existe_par_nom] : @carte_existe_par_nom=nil
#     options[:creation_restaurant_repertoire] ? @creation_restaurant_repertoire = options[:creation_restaurant_repertoire] : @carte_existe_par_nom=nil
#     options[:modification_plan_table_repertoire] ? @modification_plan_table_repertoire = options[:modification_plan_table_repertoire] : @carte_existe_par_nom=nil
#     options[:plan_table_existe_par_nom] ? @plan_table_existe_par_nom = options[:plan_table_existe_par_nom] : @carte_existe_par_nom=nil
#   end
  
#   def restaurant_existe_par_nom? nom
#     return @restaurant_existe_par_nom
#   end

#   def creation_restaurant_repertoire restaurant
#     return @creation_restaurant_repertoire
#   end

#   def modification_plan_table_repertoire nom_restaurant, nom_plan_table
#     return @modification_plan_table_repertoire
#   end

#   def plan_table_existe_par_nom? nom
#     return @plan_table_existe_par_nom
#   end

# end

# class TestNumber < Test::Unit::TestCase

#   def test_creation_restaurant_service_OK
#     options = {
#       :restaurant_existe_par_nom => false,
#       :creation_restaurant_repertoire => "CREATED"
#     }
#     restaurant = Restaurant.new("restaurant")
#     mockRestaurantRepertoire = MockRestaurantRepertoire.new(options)
#     restaurant_service = RestaurantService.new(mockRestaurantRepertoire)
#     assert_equal(restaurant_service.creation_restaurant_service(restaurant), "CREATED")
#   end  

#   def test_creation_restaurant_service_nom_existe_deja
#     options = {
#       :restaurant_existe_par_nom => true,
#     }
#     restaurant = Restaurant.new("restaurant")
#     mockRestaurantRepertoire = MockRestaurantRepertoire.new(options)
#     restaurant_service = RestaurantService.new(mockRestaurantRepertoire)
#     assert_equal(restaurant_service.creation_restaurant_service(restaurant), "ALREADY_EXIST")
#   end

#   def test_modification_plan_de_table_OK
#     options = {
#       :restaurant_existe_par_nom => true,
#       :plan_table_existe_par_nom => true,
#       :modification_plan_table_repertoire => "UPDATED"
#     }
#     restaurant = Restaurant.new("restaurant")
#     mockRestaurantRepertoire = MockRestaurantRepertoire.new(options)
#     restaurant_service = RestaurantService.new(mockRestaurantRepertoire)
#     assert_equal(restaurant_service.modification_plan_de_table(restaurant, "plat"), "UPDATED")
#   end

#   def test_modification_plan_de_table_nom_restaurant_inconnu
#     options = {
#       :restaurant_existe_par_nom => false,
#       :plan_table_existe_par_nom => true,
#       :modification_plan_table_repertoire => "UPDATED"
#     }
#     restaurant = Restaurant.new("restaurant")
#     mockRestaurantRepertoire = MockRestaurantRepertoire.new(options)
#     restaurant_service = RestaurantService.new(mockRestaurantRepertoire)
#     assert_equal(restaurant_service.modification_plan_de_table(restaurant, "plat"), "NOT_FOUND")
#   end

#   def test_modification_plan_de_table_nom_plan_table_inconnu
#     options = {
#       :restaurant_existe_par_nom => true,
#       :plan_table_existe_par_nom => false,
#       :modification_plan_table_repertoire => "UPDATED"
#     }
#     restaurant = Restaurant.new("restaurant")
#     mockRestaurantRepertoire = MockRestaurantRepertoire.new(options)
#     restaurant_service = RestaurantService.new(mockRestaurantRepertoire)
#     assert_equal(restaurant_service.modification_plan_de_table(restaurant, "plat"), "NOT_FOUND")
#   end

# end