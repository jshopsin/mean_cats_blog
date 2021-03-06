class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
