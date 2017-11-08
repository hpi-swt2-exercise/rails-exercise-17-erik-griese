class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.string :venue
      t.integer :year

      t.timestamps null: false
    end

    create_join_table :authors, :papers
  end
end
