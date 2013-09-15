class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :title
      t.string :description
      t.references :problem, index: true

      t.timestamps
    end
  end
end
