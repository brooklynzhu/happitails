class Shelter < ActiveRecord::Base
	has_many :clients
	has_many :animals
end
