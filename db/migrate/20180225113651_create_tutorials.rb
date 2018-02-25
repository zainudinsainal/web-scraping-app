class CreateTutorials < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorials do |t|
      t.references :author, foreign_key: true
      t.string :title
      t.text :content, limit: 16383
      t.datetime :published_at

      t.timestamps
    end
  end
end
