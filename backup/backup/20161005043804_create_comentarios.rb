class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.references :causa, foreign_key: true
      t.references :usuario, foreign_key: true
      t.date :data
      t.string :comentario

      t.timestamps
    end
  end
end
