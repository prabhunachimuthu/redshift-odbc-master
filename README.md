
heroku-buildpack-snowflake-odbc
===

## Usage
This requires [heroku-buildpack-apt](https://github.com/heroku/heroku-buildpack-apt) to run before
it, with the following in the Aptfile:

Use the latest url from snowflake odbc repository or use the copy stored in this repo
```
unixodbc
unixodbc-dev
https://sfc-repo.snowflakecomputing.com/odbc/linux/2.21.3/snowflake-odbc-2.21.3.x86_64.deb
```
You can configure the credentials for your connection usign the following ENV variables

* SNOWFLAKE_USERNAME
* SNOWFLAKE_PASSWORD
* SNOWFLAKE_DATABASE
* SNOWFLAKE_SERVER

## CONNECTING TO SNOWFLAKE USING THE OBDC DRIVER & RUBY

these tutorial is a copy of [snowflake connection with ruby tutorial](https://support.snowflake.net/s/article/connecting-to-snowflake-using-the-obdc-driver--ruby-on-rails-5)
A connection to Snowflake can be configured using the Snowflake ODBC driver and the Ruby gem package 'Sequel', https://github.com/jeremyevans/sequel.

Sample code:
```bash
#!/usr/local/bin/ruby
# odbc-snowflake.rb - access database via ODBC using Sequel gem
require 'odbc' # gem 'ruby-odbc'
require 'sequel' # gem 'sequel'
begin
db = Sequel.odbc('<snowflake dns>', user: '<username>', password: '<password>')
puts 'SELECT * FROM sales LIMIT 10'
db.fetch('SELECT * FROM sales LIMIT 10') do |row|
puts row
end
rescue => e
puts 'An error occurred'
puts "Error code: #{e.inspect}"
ensure
# disconnect from server
db.disconnect if db
end
```
Where <snowflake dns> is the DNS entry from the odbc.ini file.

Additional Information:

Gem package 'dpi' relies on the 'deprecated' package version 2.0.1. It is incompatible with Rails 5 ('deprecated' > 3.0.1). See the following StackOverflow article for details: http://stackoverflow.com/questions/9456768/getting-undefined-method-deprecate-error-in-ruby-dbi-gem

## HOW TO USE THESE CONNECTION
```ruby
db = Sequel.odbc('snowflake')
```

## Connection with R&R and ActiveRecord
[https://eng.localytics.com/connecting-to-snowflake-with-ruby-on-rails/](https://eng.localytics.com/connecting-to-snowflake-with-ruby-on-rails/) or check the PDF file attached

## Reference
-   [Connect Rails to Snowflake by Localytics](https://eng.localytics.com/connecting-to-snowflake-with-ruby-on-rails/)
-   [Localytics ODBC_Adaptor](https://github.com/localytics/odbc_adapter)
-   [heroku-buildpack-apt](https://github.com/heroku/heroku-buildpack-apt)
-   [Buildpack Install](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app#adding-a-buildpack)
-   [Snowflake ODBC Instructions](https://docs.snowflake.net/manuals/user-guide/odbc.html)
- [https://support.snowflake.net/s/article/connecting-to-snowflake-using-the-obdc-driver--ruby-on-rails-5](https://support.snowflake.net/s/article/connecting-to-snowflake-using-the-obdc-driver--ruby-on-rails-5)
