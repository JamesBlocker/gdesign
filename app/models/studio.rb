class Studio < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :website, presence: true
  validates :image_url, presence: true
end
