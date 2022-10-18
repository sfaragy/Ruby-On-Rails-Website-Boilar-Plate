# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Step by Step guide to initiate the Ruby On Rails Project in Docker with Docker composer:
(Note: I am using Ubuntu 22.0.4 LTS. I assume that you know how to maintain in other operating system. If any issue please contact for help.)

# Step 1:
    - Initiate a folder for Ruby Project
        $ sudo mkdir ~/Rails
        $ cd ~/Rails

    - Initiate Gemfile:
        create file name Gemfile in the root directory by terminal
         :$ sudo nano Gemfile
        Then put all the information as we have in our Gemfile here
            then ctrl + x to save and close the file

    - Open IDE to process: 
        I assume you are using VScode
        :$ code .

    - Greate a Gemfile.lock
       create file name Gemfile.lock in the root directory

    - Initiate Dockerfile
        To initial docker-compose build we need a file called Dockerfile at the root directory
        add same configuration from our Dockerfile

    - Initiate docker-compose.yml file
        To run project from docker composer we need the instructions from docker-compose.yml
        add same configuration but with different name / same image name if you want.

    - Install Docker Composer in your system if it is not installed yet.

    - Initiate Makefile to shorten the commands for Docker
        Please add same configuration from our root directory Makefile

# Step 2:
    - Initiate the command to generate all files:
        #**-------------------------- ---------------------------
        # to download & build all necessary files for the new ruby project (@important Command)
        #**------------------------------------------------------

        $ docker-compose run  app rails new . --force --database=mysql -skip-bundle

# Step 3:
    - Configuration of Database:
        Please check the configuration of the file and replace with your local fils
            # config/database.yml  

# Step 4:
    - Build Docker images:
        Open terminal in VScode ctrl + ~
        $ make build

    - Start project
        $ make up

# Step 5:
    - Database Creation
        $ make db-create

    - Database Migration
        $ make db-migrate:

# Step 6:
    - Restart the application
        $ make restart
    - Start application
        $ make start
    - Stop application
        $ make stop
    - Login to the Rails Console:
        $ make login-app
    - Check existing dockers:
        $ make ps

# Step 7:
    - Browse the page by the following URL
        http://localhost:3001



# ==== Components Doc ====
# How to Create Components

    -$ make lognin-app
        
        -$ bundle add view_component

        -$ rails g component header taitle
            out:
                create  app/components/header_component.rb
                invoke  test_unit
                create    test/components/header_component_test.rb
                invoke  erb
                create    app/components/header_component.html.erb


                
# How to test the components?
    Please follow the link below and write the test cases as you need.
    https://viewcomponent.org/guide/testing.html
    Mose of the cases you have to write test cases with good assertions.
    Also it will check the frontend view and UI matchings with tags similarty with mock




# === Tailwindcss in Rails Doc ===
  
# Automatically configure tailwindcss in rails project
    $ rails new my-app --css tailwind

# Manually add tailwindcss in rails project
    Step 1: Install the tailwindcss-rails gem  
    Step 2: Run the install command to generate a tailwind.config.js file in the ./config directory.

    In rails terminal: 
        $ ./bin/bundle add tailwindcss-rails
        $ ./bin/rails tailwindcss:install
    
    Step 3: Configure your template paths
        Add the paths to all of your template files to your ./config/tailwind.config.js file.

            /** @type {import('tailwindcss').Config} */ 
            module.exports = {
            content: [
                './app/helpers/**/*.rb',
                './app/javascript/**/*.js',
                './app/views/**/*',
            ],
            theme: {
                extend: {},
            },
            plugins: [],
            }
    Step 4: Add the Tailwind directives to your CSS
        Add the @tailwind directives for each of Tailwind's layers to your application.tailwind.css file located in the ./app/assets/stylesheets directory.

            @tailwind base;
            @tailwind components;
            @tailwind utilities;
    Step 5: Start your build process
        $ ./bin/dev.

    Step 6: Start using Tailwind & Tailwind's utility classes in your project.

    Example: 
        <h1 class="text-3xl font-bold underline">
            Hello world!
        </h1>

    Note: https://tailwindcss.com/docs this will give more detials about tailwindcss

    Step 7: 
        Build tailwindcss stylesheets
        $ rails tailwindcss:build

    Errors: 
        After install you might get this errors below:
            "Sprockets::Rails::Helper::AssetNotFound in Pages#home 
            Showing /noteapp/app/views/layouts/application.html.erb where line #8 raised:
            The asset "tailwind.css" is not present in the asset pipeline."

        Solution:
            $ bundle exec rake assets:precompile
            Next:
                Edit /noteapp/app/views/layouts/application.html.erb 

                Find tailwind

                replace with /bundle/tailwind

                FInd "inter-font", 
                
                remove it


# Install RSPEC
## Step 1 — Delete Any Existing Test Folders

If I’ve generated a new rails app using rails new <app> without using any additional flags, I remove the app/test directory:

## Step 2 — Add Gems

I add the following gems to the :development, :test group in my Gemfile and run bundle.

    group :development, :test do
        gem 'byebug', platform: :mri
        gem 'rspec-rails', '~> 3.5'
        gem 'factory_girl_rails'
        gem 'capybara'
        gem 'database_cleaner'
    end

   Briefly running through these gems one-by-one:

    byebug allows for step-through debugging by placing byebug anywhere in the app.
    rspec-rails is the testing framework.
    factory_girl_rails replaces Rails fixtures for generating data to use in the tests.
    capybara provides helper methods that make integration testing easier.
    database_cleaner allows us to manage our testing database with precision: we decide when to wipe data (e.g. after, before tests). 


## make build

## Step 3 — Run Rspec Generator

Currently, the app directory doesn’t include a app/test/ directory (remember we deleted it in step 1), so I have nowhere to put my tests. This is where the Rspec generator, which will generate app/spec/, comes in:

    make login-app
    rails generate rspec:install

This adds the following files in a app/spec directory:

    spec/spec_helper.rb
    spec/rails_helper.rb

and app/.rspec in the project’s root directory.

Now I’ve added the proper files to use Rspec instead of Minitest::Unit, but I still need to do a little more configuration before Rspec will work with the factory_girl_rails, capybara, and database_cleaner gems.

## Step 4 — Configure Rspec

Open up spec/rails_helper.rb. All of the instructions from this section will be implemented in this file. I include the complete rails_helper.rb file at the bottom of this section.

## database_cleaner

To use database_cleaner, I add require 'database_cleaner' below require 'rspec/rails', and change the following line in the Rspec.configure bloc from

    config.use_transactional_fixtures = true 
    to 
    config.use_transactional_fixtures = false

Then I add the following to the Rspec.configure block:

    RSpec.configure do |config|  #...omitted code...  config.use_transactional_fixtures = false  config.before(:suite) do
        DatabaseCleaner.clean_with(:truncation)
    end  config.before(:each) do
        DatabaseCleaner.strategy = :transaction
    end  config.before(:each, :js => true) do
        DatabaseCleaner.strategy = :truncation
    end  config.before(:each) do
        DatabaseCleaner.start
    end  config.after(:each) do
        DatabaseCleaner.clean
    end  config.before(:all) do
        DatabaseCleaner.start
    end  config.after(:all) do
        DatabaseCleaner.clean
    end #...omitted code...
    
    end

## capybara


To use capybara, I add require 'capybara/rspec' after require 'rspec/rails'.

    factory_girl_rails

To use factory_girl_rails, I remove this line:
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

And add to the Rspec.configure block:

    config.include FactoryGirl::Syntax::Methods

This will give me access to FactoryGirl methods like build and create. I place all of my factories in the spec/factories directory.
## Devise

If my app uses devise for authentication, I add:

    config.include Devise::Test::ControllerHelpers, type: :controller

to the Rspec.configure block. This gives me helper methods like sign_in.

## miscellaneous pointers

At the bottom of Rspec.configure block, you’ll see the following line:

    config.infer_spec_type_from_file_location!

This allows rails to infer from the location of the spec file what kind of test it is and then give you context-specific helper methods (e.g. using get and post in controller tests if the file is found in the spec/controllers directory).

My complete rails_helper.rb file looks like this:

    ENV['RAILS_ENV'] ||= 'test'require 'spec_helper'
        require File.expand_path('../../config/environment', __FILE__)
        require 'rspec/rails'
        require 'database_cleaner'
        require 'capybara/rspec'Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
        ActiveRecord::Migration.maintain_test_schema!RSpec.configure do |config|
        config.use_transactional_fixtures = false
        config.include FactoryGirl::Syntax::Methods
        config.include Devise::Test::ControllerHelpers, type: :controller
        config.before(:suite) do
            DatabaseCleaner.clean_with(:truncation)
        end
        config.before(:each) do
            DatabaseCleaner.strategy = :transaction
        end
        config.before(:each, js: true) do
            DatabaseCleaner.strategy = :truncation
        end
        config.before(:each) do
            DatabaseCleaner.start
        end
        config.after(:each) do
            DatabaseCleaner.clean
        end
        config.before(:all) do
            DatabaseCleaner.start
        end
        config.after(:all) do
            DatabaseCleaner.clean
        end
        config.infer_spec_type_from_file_location!
    end


## Step 5 — Write Tests

Now I’m ready to write some tests, all of which reside in the spec directory. Typically my spec directory looks something like this:
spec/
  controllers/
    user_controller_spec.rb
    resource_controller_spec.rb
  factories/
    user.rb
    resource.rb
  models/
    user_spec.rb
    resource_spec.rb
  mailers/
    mailer_spec.rb
  services/
    service_spec.rb  
  rails_helper.rb
  spec_helper.rb


