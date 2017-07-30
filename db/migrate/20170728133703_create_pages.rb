class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :url
      t.datetime :visited_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
