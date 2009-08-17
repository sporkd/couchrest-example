require 'rubygems'
require 'couchrest'

class Address < Hash
  include CouchRest::CastedModel
  include CouchRest::Validation
  
  property :street_address
  property :city
  property :state
  property :zip
  property :country, :default => "USA"
  
  validates_present :street_address, :city, :state, :zip
  validates_is_number :zip
  validates_length :zip, :is => 5
  
  def to_s
    address_str = "#{street_address}<br />"
    address_str << "#{city}, " if city
    address_str << "#{state}<br />" unless state.blank?
    address_str << " #{zip}<br />" unless zip.blank?
    address_str << "\n#{country}<br />" unless country.blank?
    address_str
  end
end
