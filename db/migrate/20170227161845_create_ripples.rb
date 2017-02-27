class CreateRipples < ActiveRecord::Migration[5.0]
  def change
    create_table :ripples do |t|
      t.string :name
      t.text :url
      t.text :message

      t.timestamps
    end
  end
end
