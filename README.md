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


    
