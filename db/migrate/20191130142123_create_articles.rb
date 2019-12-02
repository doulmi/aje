class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :raw_content
      t.text :rendered_content
      t.string :level

      t.timestamps
    end
  end
end
