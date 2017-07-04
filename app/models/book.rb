class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  validates :title, presence: true
end
