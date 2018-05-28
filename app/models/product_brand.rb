# frozen_string_literal: true

class ProductBrand < ApplicationRecord
  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name
end
