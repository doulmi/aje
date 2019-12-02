class CreateCarousels < ActiveRecord::Migration[6.0]
  def change
    create_table :carousels do |t|
      t.string :title
      t.string :src
      t.string :url

      t.timestamps
    end
  end
end
