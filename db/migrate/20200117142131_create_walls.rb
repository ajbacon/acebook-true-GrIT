class CreateWalls < ActiveRecord::Migration[5.1]
  def change
    create_table :walls do |t|
    end
    add_reference :walls, :post, foreign_key: true
    add_reference :walls, :user, foreign_key: true
  end
end
