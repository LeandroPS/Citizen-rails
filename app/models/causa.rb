class Causa < ApplicationRecord
  belongs_to :user
  belongs_to :cidade
	has_many :comentarios
	has_many :apoios
end
