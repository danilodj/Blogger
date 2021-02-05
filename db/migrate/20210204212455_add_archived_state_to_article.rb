class AddArchivedStateToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :archived, :boolean, null: false, default: false
  end
end
