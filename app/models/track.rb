class Track < ApplicationRecord
  has_and_belongs_to_many :links
  before_validation :set_country

  def set_country
    self.country = Geocoder.search(ip_address).first.country rescue ""
  end

end
