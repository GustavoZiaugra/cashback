# frozen_string_literal: true

class AddStateToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :state, :string
  end
end
