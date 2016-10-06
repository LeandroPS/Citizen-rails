class CreateCausas < ActiveRecord::Migration[5.0]
  def change
    create_table :causas do |t|
      t.string :titulo
      t.string :descricao
      t.references :user, foreign_key: true
      t.string :foto
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
