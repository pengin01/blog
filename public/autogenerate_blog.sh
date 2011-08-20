#/bin/sh
CREATE_PEOJECT="rails _3.0.9_ new blog"
CD="cd ./blog"
BUDLE_INSTALL="bundle install --path ./vendor/bundle"
DB_CREATE="bundle exec rake db:create"
CONTROLLER_CREATE="bundle exec rails g controller home index"
SCAFFOLD_CREATE="bundle exec rails g scaffold Post name:string title:string content:text"
DB_MIGRATE="bundle exec rake db:migrate"

eval $CREATE_PEOJECT
eval $CD
eval $BUDLE_INSTALL
eval $DB_CREATE
eval $CONTROLLER_CREATE
eval $SCAFFOLD_CREATE
eval $DB_MIGRATE