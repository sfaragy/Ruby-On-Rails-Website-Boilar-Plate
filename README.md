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

    
