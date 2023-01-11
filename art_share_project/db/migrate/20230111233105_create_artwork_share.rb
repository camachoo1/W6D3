class CreateArtworkShare < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, null: false, foreign_key: { to_table: :artworks }
      t.references :viewer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
