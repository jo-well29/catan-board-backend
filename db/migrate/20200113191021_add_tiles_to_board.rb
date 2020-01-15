class AddTilesToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :tiles, :string, array: true, default: []
  end
end
