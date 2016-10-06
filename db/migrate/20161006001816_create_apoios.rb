class CreateApoios < ActiveRecord::Migration[5.0]
  def change
    create_table :apoios do |t|
      t.references :user, foreign_key: true
      t.references :causa, foreign_key: true

      t.timestamps
    end
  end
end
