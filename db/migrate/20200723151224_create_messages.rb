class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.string :athor
      t.string :image

      t.timestamps
    end
  end
end
