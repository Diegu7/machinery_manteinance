# frozen_string_literal: true

class DropProductCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :product_categories
  end
end
