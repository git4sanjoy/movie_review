class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  mount_uploader :image, ImageUploader
  validates_presence_of :title, :description
  searchkick
end
