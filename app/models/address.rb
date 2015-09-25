class Address < ActiveRecord::Base
  belongs_to :organization
  has_many :areas
end
