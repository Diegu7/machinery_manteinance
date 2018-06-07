export SECRET_KEY_BASE=$(RAILS_ENV=production rake secret)
rails server -e production -p 1100 -b 0.0.0.0
