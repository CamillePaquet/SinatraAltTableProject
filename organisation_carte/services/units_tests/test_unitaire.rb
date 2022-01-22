require "test/unit"
require_relative "../platService"

include Sample::Services

class TestNumber < Test::Unit::TestCase

  def test_type_is_correct_with_correct_type
    attributs_plat = {
        "nom" => "Fromage",
        "prix" => 3.0,
        "description" => "plateau",
        "type" => "aperitif"
      }
      plat = PlatService.new(attributs_plat)
    assert_equal(plat.type_correct?("aperitif"), true)
    assert_equal(plat.type_correct?("entree"), true)
    assert_equal(plat.type_correct?("plat principal"), true)
    assert_equal(plat.type_correct?("dessert"), true)
    assert_equal(plat.type_correct?("boisson"), true)
  end

  def test_type_is_correct_with_uncorrect_type
    attributs_plat = {
        "nom" => "Fromage",
        "prix" => 3.0,
        "description" => "plateau",
        "type" => "aperitif"
      }
      plat = PlatService.new(attributs_plat)
    assert_equal(plat.type_correct?("blabla"), false)
    assert_equal(plat.type_correct?("desser"), false)
  end





end