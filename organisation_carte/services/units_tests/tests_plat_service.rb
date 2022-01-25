require "test/unit"
require_relative "../platService"
require_relative "../plat"
require_relative "../../repository/plat_repository"

include Sample::Services
include Sample::Repository

class MockPlatRepertoire
  def initialize options = {}
    options[:plat_existe_par_nom] ? @plat_existe_par_nom = options[:plat_existe_par_nom] : @plat_existe_par_nom=nil
    options[:ajout_plat_repertoire] ? @ajout_plat_repertoire = options[:ajout_plat_repertoire] : @ajout_plat_repertoire=nil
    options[:modification_quantite_repertoire] ? @modification_quantite_repertoire = options[:modification_quantite_repertoire] : @modification_quantite_repertoire=nil
    options[:recuperation_liste_plats_repertoire] ? @recuperation_liste_plats_repertoire = options[:recuperation_liste_plats_repertoire] : @recuperation_liste_plats_repertoire=nil
  end

  def plat_existe_par_nom? nom
    return @plat_existe_par_nom
  end

  def ajout_plat_repertoire options = {}
      return @ajout_plat_repertoire
  end

  def modification_quantite_repertoire options = {}
    @modification_quantite_repertoire
  end

  def recuperation_liste_plats_repertoire
    @recuperation_liste_plats_repertoire
  end

end

class TestNumber < Test::Unit::TestCase

  def test_type_est_correct_avec_type_correct
    mockPlatRepertoire = MockPlatRepertoire.new()
    platService = PlatService.new(mockPlatRepertoire)
    assert_equal(platService.type_correct?("aperitif"), true)
    assert_equal(platService.type_correct?("entree"), true)
    assert_equal(platService.type_correct?("plat principal"), true)
    assert_equal(platService.type_correct?("dessert"), true)
    assert_equal(platService.type_correct?("boisson"), true)
  end

  def test_type_est_correct_avec_type_incorrect
    mockPlatRepertoire = MockPlatRepertoire.new()
    platService = PlatService.new(mockPlatRepertoire)
    assert_equal(platService.type_correct?("blabla"), false)
    assert_equal(platService.type_correct?("desser"), false)
  end

  def test_prix_correct_et_arrondir
    mockPlatRepertoire = MockPlatRepertoire.new()
    platService = PlatService.new(mockPlatRepertoire)
    assert_equal(platService.prix_correct_et_arrondir("blabla"), -1)
    assert_equal(platService.prix_correct_et_arrondir(1), 1.0)
    assert_equal(platService.prix_correct_et_arrondir(1.22), 1.22)
    assert_equal(platService.prix_correct_et_arrondir(1.2223), 1.22)
  end

  def test_ajout_plat_avec_attributs_incorrects_et_type_correct
    options = {
      :plat_existe_par_nom => false,
      :ajout_plat_repertoire => "CREATED"
    }
    mockPlatRepertoire = MockPlatRepertoire.new(options)
    plat_service = PlatService.new(mockPlatRepertoire)
    plat_attributs = {
      "nom": "Fromage",
      "description": "Plateau de fromage",
      "prix": 3.0,
      "type": "dessert"
    }
    plat = Plat.new(plat_attributs)
    assert_equal(plat_service.ajout_plat_service(plat), "CREATED")
  end

  def test_ajout_plat_avec_nom_exsite_deja_et_type_correct
    options = {
      :plat_existe_par_nom => true,
    }
    mockPlatRepertoire = MockPlatRepertoire.new(options)
    plat_service = PlatService.new(mockPlatRepertoire)
    plat_attributs = {
      "nom": "Fromage",
      "description": "Plateau de fromage",
      "prix": 3.0,
      "type": "dessert"
    }
    plat = Plat.new(plat_attributs)
    assert_equal(plat_service.ajout_plat_service(plat), "ALREADY_EXIST")
  end

  def test_ajout_plat_avec_type_incorrect
    options = {
    }
    mockPlatRepertoire = MockPlatRepertoire.new(options)
    plat_service = PlatService.new(mockPlatRepertoire)
    plat_attributs = {
      "nom": "Fromage",
      "description": "Plateau de fromage",
      "prix": 3.0,
      "type": "dessert givré"
    }
    plat = Plat.new(plat_attributs)
    assert_equal(plat_service.ajout_plat_service(plat), "BAD_REQUEST")
  end

  def test_modification_quantite_service_avec_plat_existant
    options = {
      :modification_quantite_repertoire => "UPDATED",
      :plat_existe_par_nom => true,
    }
    mockPlatRepertoire = MockPlatRepertoire.new(options)
    plat_service = PlatService.new(mockPlatRepertoire)
    plat_attributs = {
      "nom": "Fromage",
      "quantite": 20,
    }
    plat = Plat.new(plat_attributs)
    assert_equal(plat_service.modification_quantite_service(plat), "UPDATED")
  end  

  def test_modification_quantite_service_avec_plat_existe_pas
    options = {
      :plat_existe_par_nom => false,
    }
    mockPlatRepertoire = MockPlatRepertoire.new(options)
    plat_service = PlatService.new(mockPlatRepertoire)
    plat_attributs = {
      "nom": "Fromage",
      "quantite": 20,
    }
    plat = Plat.new(plat_attributs)
    assert_equal(plat_service.modification_quantite_service(plat), "NOTFOUND")
  end  

  def test_recuperation_liste_plats
    options = {
      :recuperation_liste_plats_repertoire => [],
    }
    mockPlatRepertoire = MockPlatRepertoire.new(options)
    plat_service = PlatService.new(mockPlatRepertoire)
    assert_equal(plat_service.recuperation_liste_plats(), [])
  end  

  #ajouter test mauvais prix et mauvaise quantité

end