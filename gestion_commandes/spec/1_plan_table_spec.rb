# coding: utf-8
require_relative 'prepare'

describe 'Organisation Carte REST API' do
  before :all do
    Mongoid.purge!
    $service = RestService::new :service => Sample::Backend
  end

  subject { $service }
  context "POST /altTable/api/planTable : post un nouveau plan de table" do
    it {
        plan_table = {
          "nom": "Plan",
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
        expect(subject.post('/altTable/api/planTable',plan_table.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 201 }
  end

  subject { $service }
  context "POST /altTable/api/planTable : post un nouveau plan de table" do
    it {
        plan_table = {
          "nom": "Plan2",
          "tables":[
              {
          "numero": 1,
          "convives": 3
          },
          {
          "numero": 2,
          "convives": 7
          }
          ]
        } 
        expect(subject.post('/altTable/api/planTable',plan_table.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 201 }
  end

end
