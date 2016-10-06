class Comentario < ApplicationRecord
  belongs_to :causa
  belongs_to :user
end
