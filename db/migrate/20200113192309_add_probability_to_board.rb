class AddProbabilityToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :probability, :string, array: true, default: []
  end
end
