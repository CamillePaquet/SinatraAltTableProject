# coding: utf-8
require_relative 'prepare'

describe 'Organisation Carte REST API' do
  before :all do
    Mongoid.purge!
    $service = RestService::new :service => Sample::Backend
  end

  subject { $service }
  context "POST /altTable/api/plats : post un nouveau plat" do
    it {
        plat = {
            :nom => "Tapas",
            :description => "Tapas mix",
            :prix => 3.0,
            :type => "aperitif"
        } 
        expect(subject.post('/altTable/api/plats',plat.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 201 }
  end

  context "GET /altTable/api/plats : recupération des plats, il doit récupérer un seul plat" do
    it { expect(subject.get('/altTable/api/plats')).to be_correctly_sent }
    it { expect(subject).to respond_with_status 200 }
    it { expect(subject).to respond_a_collection_of_record }
    it { expect(subject).to respond_with_collection_size 1 }
  end

  context "POST /altTable/api/plats : post un plat qui existe déjà" do
    it {
        plat = {
            :nom => "Tapas",
            :description => "Tapas mix",
            :prix => 3.0,
            :type => "aperitif"
        } 
        expect(subject.post('/altTable/api/plats',plat.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 400 }
  end

  context "GET /altTable/api/plats : recupération des plats il doit récupérer un seul plat" do
    it { expect(subject.get('/altTable/api/plats')).to be_correctly_sent }
    it { expect(subject).to respond_with_status 200 }
    it { expect(subject).to respond_a_collection_of_record }
    it { expect(subject).to respond_with_collection_size 1 }
  end

  context "POST /altTable/api/plats : post un plat avec un type qui n'existe pas" do
    it {
        plat = {
            :nom => "Raclette",
            :description => "Tapas mix",
            :prix => 3.0,
            :type => "blabla"
        } 
        expect(subject.post('/altTable/api/plats',plat.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 400 }
  end

  context "GET /altTable/api/plats : recupération des plats il doit récupérer un seul plat" do
    it { expect(subject.get('/altTable/api/plats')).to be_correctly_sent }
    it { expect(subject).to respond_with_status 200 }
    it { expect(subject).to respond_a_collection_of_record }
    it { expect(subject).to respond_with_collection_size 1 }
  end

  context "POST /altTable/api/plats : post un plat avec une quantite indiquée" do
    it {
        plat = {
            :nom => "Raclette",
            :description => "Tapas mix",
            :prix => 3.0,
            :type => "blabla",
            :quantite => 20
        } 
        expect(subject.post('/altTable/api/plats',plat.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 400 }
  end

  context "GET /altTable/api/plats : recupération des plats qui ont une quantité supérieur à 0" do
    it { expect(subject.get('/altTable/api/carte')).to be_correctly_sent }
    it { expect(subject).to respond_with_status 200 }
    it { expect(subject).to respond_a_collection_of_record }
    it { expect(subject).to respond_with_collection_size 0 }
  end

  context "PATCH /altTable/api/plats/Tapas/quantite : modifie la quantite d'un plat avec une quantite de 20" do
    it {
        plat = {
            :quantite => 20
        } 
        expect(subject.patch('/altTable/api/plats/Tapas/quantite',plat.to_json)).to be_correctly_sent 
    }
    it { expect(subject).to respond_with_status 200 }
  end

  context "GET /altTable/api/plats : recupération des plats qui ont une quantité supérieur à 0" do
    it { expect(subject.get('/altTable/api/carte')).to be_correctly_sent }
    it { expect(subject).to respond_with_status 200 }
    it { expect(subject).to respond_a_collection_of_record }
    it { expect(subject).to respond_with_collection_size 1 }
  end






end
