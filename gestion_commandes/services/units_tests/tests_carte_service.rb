require "test/unit"
require_relative "../carteService"
require_relative "../carte"
require_relative "../../repository/carte_repository"

include Sample::Services
include Sample::Repository

class MockCarteRepertoire
  def initialize options = {}
    options[:recuperation_liste_plats_dispo] ? @recuperation_liste_plats_dispo = options[:recuperation_liste_plats_dispo] : @carte_existe_par_nom=nil
  end

  def recuperation_liste_plats_dispo()  
    return @recuperation_liste_plats_dispo
  end
end

class TestNumber < Test::Unit::TestCase

  def test_recuperation_plats_disponibles
    options = {
      :recuperation_liste_plats_dispo => [],
    }
    mockCarteRepertoire = MockCarteRepertoire.new(options)
    carte_service = CarteService.new(mockCarteRepertoire)
    assert_equal(carte_service.recuperation_plats_disponibles(), [])
  end  
end