class AddTitleBodyToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :body, :text
  end
end
