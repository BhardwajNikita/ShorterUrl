class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :slug, null: false
      t.datetime :expires_at,  default: -> { 'CURRENT_DATE'}

      t.timestamps
    end
  end
end
