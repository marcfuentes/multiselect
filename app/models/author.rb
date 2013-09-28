class Author < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many  :authorbooks
  has_many  :books, :through => :authorbooks
end
