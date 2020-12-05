class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :content

      # t.datetime :created_at
      # t.datetime :updated_at
      t.timestamps
    end
  end
end
