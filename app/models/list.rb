class List < ApplicationRecord
  has_one_attached :photo
  has_many :bookmarks
  has_many :movies, :through => :bookmarks, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :name
end
