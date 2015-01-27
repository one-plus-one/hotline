class Catalog < ActiveRecord::Base
  has_many :repositories
end
