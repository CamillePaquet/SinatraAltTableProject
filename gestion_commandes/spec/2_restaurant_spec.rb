# coding: utf-8
require_relative 'prepare'

describe 'Organisation Carte REST API' do
  before :all do
    $service = RestService::new :service => Sample::Backend
  end

  subject { $service }
  context "POST /altTable/api/restaurant : post un nouveau restaurant" do
    it {
        restaurant = {
          "nom": "Bistrot"
        }
        expect(subject.post('/altTable/api/restaurant',restaurant.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 201 }
  end

  subject { $service }
  context "PATCH /altTable/api/restaurant/:nomRestaurant/planTable : ajoute un plan de table au restaurant" do
    it {
        restaurant = {
          "nom_plan_table": "Plan"
      }
        expect(subject.patch('/altTable/api/restaurant/Bistrot/planTable',restaurant.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 200 }
  end



end
