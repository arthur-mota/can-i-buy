class Profile < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :profile_name, presence: true, uniqueness: true, length: { in: 3..20 }
end
