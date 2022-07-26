class Link < ApplicationRecord
  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..255, on: :create, message: "too long"
  validates_length_of :slug, is: 5, on: :create, message: "too short/long"
  has_and_belongs_to_many :tracks

  before_validation :generate_slug

  def generate_slug
    if self.slug.nil? || self.slug.empty?
      loop do
        self.slug = SecureRandom.uuid[0..4]
        break if Link.where(slug: self.slug).count == 0
      end
    end
    true
  end

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end



end
