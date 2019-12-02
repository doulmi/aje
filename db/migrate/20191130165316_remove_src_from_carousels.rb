class RemoveSrcFromCarousels < ActiveRecord::Migration[6.0]
  def change
    remove_column :carousels, :src
  end
end
