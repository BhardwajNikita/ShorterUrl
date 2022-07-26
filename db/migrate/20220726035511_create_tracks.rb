class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :ip_address
      t.string :country

      t.timestamps
    end
  end
end
