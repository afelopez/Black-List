class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :summoner
      t.string :types
      t.string :reason
      t.text :detail

      t.timestamps
    end
  end
end
