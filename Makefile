dbinit:
		bundle exec rake db:create db:seed

lint :
		bundle exec rubocop

test :
		bundle exec rspec

precheck :
		lint test

heroku : test
		git push heroku master
