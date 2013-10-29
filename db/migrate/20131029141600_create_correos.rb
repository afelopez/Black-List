class CreateCorreos < ActiveRecord::Migration
  def change
    create_table :correos do |t|
      t.string :correo

      t.timestamps
    end
  end
end
