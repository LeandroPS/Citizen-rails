class Cidade < ApplicationRecord
	has_many :users
	
	def to_s
		self.nome
	end
end
