class ArticlesAndComments < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
  	  t.belongs_to :user
      t.string :title
      t.string :content 
      t.timestamps 
    end
    create_table :comments do |t|
  	  t.belongs_to :user
      t.belongs_to :article
      t.string :content
      t.string :user
      t.timestamps
    end
  end
end
