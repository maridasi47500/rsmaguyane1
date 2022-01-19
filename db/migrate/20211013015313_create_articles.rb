class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :member_id
      t.timestamps
    end
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :member_id
      t.integer :hits
      t.timestamps
    end
    create_table :ratings do |t|
      t.integer :member_id
      t.integer :image_id
      t.integer :rating
      t.timestamps
    end
    create_table :images do |t|
      t.string :title
      t.date :date
      t.integer :member_id
      t.integer :category_id
      t.integer :hits
      t.string :image
      t.timestamps
    end
  end
end
