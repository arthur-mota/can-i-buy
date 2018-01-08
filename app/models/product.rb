class Product < ApplicationRecord
  belongs_to :profile

  validates :profile_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, length: { in: 2..255 }
  validates :url, presence: false
end
