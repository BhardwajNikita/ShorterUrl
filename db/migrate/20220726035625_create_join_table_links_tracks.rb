class CreateJoinTableLinksTracks < ActiveRecord::Migration[7.0]
  def change
    create_join_table :links, :tracks do |t|
    end
  end
end
