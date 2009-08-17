require 'rubygems'
require 'couchrest'

class User < CouchRest::ExtendedDocument
  include CouchRest::Validation
  
  use_database CouchRest.database!('couchrest_example')
  timestamps!
  
  property :name
  property :email
  property :birthdate
  property :gender
  property :address, :cast_as => 'Address'
  
  validates_present :name, :email
end
