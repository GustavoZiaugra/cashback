# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :advertiser_name
      t.string :url
      t.string :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :premium

      t.timestamps
    end
    add_index :offers, :advertiser_name, unique: true
  end
end
