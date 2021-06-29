class Link < ApplicationRecord
  require 'mechanize'

  has_many :clicks
  before_save :generate_slug

  validates :full_url, presence: true, format: URI::regexp(%w[http https])

  def generate_slug
    self.slug = SecureRandom.alphanumeric(4)
  end

  def title
    Mechanize.new.get(full_url).title
  end
end
