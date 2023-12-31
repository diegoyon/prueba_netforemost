class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :image_url
      t.datetime :published
      t.text :content

      t.timestamps
    end
  end
end
