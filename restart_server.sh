RAILS_ENV=production rails assets:precompile
RAILS_ENV=production rails db:migrate

RAILS_ENV=production rails server -p 3000 &

