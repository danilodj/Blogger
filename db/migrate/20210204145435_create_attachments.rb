class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.integer :article_id
      t.timestamps
    end
  end
end
