# coding: utf-8
require_relative 'prepare'

describe 'Plat REST API' do
  before :all do
    $service = RestService::new :service => Sample::Backend
  end

  subject { $service }
  context "POST /altTable/api/creationPlat : post un nouveau plat" do
    it {
        plat = {
            "nom": "Tapas",
            "description": "Tapas mix",
            "prix": 3.0,
            "type": "aperitif"
        } 
        expect(subject.post('/altTable/api/creationPlat',plat)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 200 }
  end


end
