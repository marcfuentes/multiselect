class Book < ActiveRecord::Base
  attr_accessible :name

   validates :name, :presence => true

   has_many  :authorbooks
   has_many  :authors, :through => :authorbooks
end
