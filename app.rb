require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'sinatra/namespace'
require_relative 'helpers/init'
require_relative 'organisation_carte/repository/init'
require_relative 'organisation_carte/models/init'
require_relative 'organisation_carte/services/init'
require_relative 'gestion_commandes/repository/init'
require_relative 'gestion_commandes/models/init'
require_relative 'gestion_commandes/services/init'

module Sample
  class Sample::Backend < Sinatra::Base


    set :port, 9292
    set :bind, '0.0.0.0'

    register Sinatra::Namespace

    Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

  end
end

require_relative 'organisation_carte/controller/init'
require_relative 'gestion_commandes/controller/init'