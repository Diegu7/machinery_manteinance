# frozen_string_literal: true

class RemoveImageFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :image, :string
  end
end
