class Movie < ApplicationRecord
  has_many :bookmarks
  validates_uniqueness_of :title
  validates_presence_of :title
  validates_presence_of :overview
end
