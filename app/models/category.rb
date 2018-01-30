class Category < ActiveRecord::Base
  #associations
  has_many :items 
end
