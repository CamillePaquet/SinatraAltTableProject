# coding: utf-8
require_relative 'prepare'

describe 'Gestion commandes service REST API' do
  before :all do
    $service = RestService::new :service => Sample::Backend
  end

  subject { $service }
  context "POST /altTable/api/service/:nom_restaurant : post un nouveau service dans un restaurant" do
    it { expect(subject.post('/altTable/api/service/Bistrot',{}.to_json)).to be_correctly_sent }
    it { expect(subject).to respond_with_status 201 }
  end

  subject { $service }
  context "POST /altTable/api/service/:nom_restaurant : post un nouveau service dans un restaurant qui n'existe pas" do
    it { expect(subject.post('/altTable/api/service/Restaurant',{}.to_json)).to be_correctly_sent }
    it { expect(subject).to respond_with_status 404 }
  end

  subject { $service }
  context "PATCH /altTable/api/service/:nom_restaurant : installe des clients à un service dans un restaurant" do
    it { 
      installation = {
        :clients => 2,
        :numero_table => 1
      }
      expect(subject.patch('/altTable/api/service/Bistrot',installation.to_json)).to be_correctly_sent }
    it { expect(subject).to respond_with_status 200 }
  end

  subject { $service }
  context "PATCH /altTable/api/service/:nom_restaurant : installe des clients à une table ou le nombre ne convives n'est pas suffisant dans un restaurant" do
    it { 
      installation = {
        :clients => 9,
        :numero_table => 2
      }
      expect(subject.patch('/altTable/api/service/Bistrot',installation.to_json)).to be_correctly_sent }
    it { expect(subject).to respond_with_status 400 }
  end

  subject { $service }
  context "PATCH /altTable/api/service/:nom_restaurant : installe des clients à une table déjà reservée dans un restaurant" do
    it { 
      installation = {
        :clients => 3,
        :numero_table => 1
      }
      expect(subject.patch('/altTable/api/service/Bistrot',installation.to_json)).to be_correctly_sent }
    it { expect(subject).to respond_with_status 400 }
  end

  subject { $service }
  context "PATCH /altTable/api/service/:nom_restaurant : installe une table sans clients à un service dans un restaurant" do
    it { 
      installation = {
        :clients => 0,
        :numero_table => 3
      }
      expect(subject.patch('/altTable/api/service/Bistrot',installation.to_json)).to be_correctly_sent }
    it { expect(subject).to respond_with_status 400 }
  end



end
