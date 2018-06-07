# should only run this when first installing the app
RAILS_ENV=production rails db:create db:migrate db:seed
