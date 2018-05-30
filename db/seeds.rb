# frozen_string_literal: true

user = User.new(
  username: 'admin',
  password: 'admin',
  password_confirmation: 'admin',
  first_name: 'admin',
  middle_name: 'admin',
  last_name: 'admin',
  email: 'admin@admin.org'
)

user.save

section = MachineSection.new(name: 'Seccion')
section.save

machine = Machine.new(
  name: 'Excalibur',
  description: 'Best sword',
  machine_section_id: 1
)
machine.save

area = MachineArea.new(name: 'Best Area')
area.save

brand = ProductBrand.new(name: 'TOMCAT')
brand.save

product = Product.new(
  name: 'Tornillo',
  product_brand_id: 1,
  code: '01010101',
  specifications: 'None',
  initial_stock: 10,
  current_stock: 5,
  minimum: 1,
  maximum: 100
)
product.save
