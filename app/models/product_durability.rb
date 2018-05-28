# frozen_string_literal: true

class ProductDurability < ApplicationRecord
  belongs_to :materials_for_maintenance
end
