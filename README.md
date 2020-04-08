## Chitter ##

In which I created a working twitter clone named Chitter. Based of the cockatoos that I grew up with Chitter will take all tweets given by multiple users and then return them as capitals.

Chitter will store the information of the peeps (tweets) in a local database and it is possible in a SQL interface to list all avilable tweets by a certain user.

You can also sign up to Chitter, store you own peeps and even create some to be posted to the database.

This was all created using an MVC model and has been built on the front-end using HTML, controller side using Sinatra and Ruby and finally the database's are built using SQL and interfaced with via the rubygem 'pg'

To run Chitter you need to create the databases stored below (I will leave the details for the SQL code below) and rund bundle within the terminal. Finally launch the app either through the command 'rackup' or 'ruby app.rb'.

AND ENJOY!

## Database Creation SQL Commands ##

- Please note if run in test mode then the rspec/Capybara tests will look for a test database named 'chitter_test'

- users - In which all users are stored
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email" varchar(60),
    "username" varchar(255),
    "realname" varchar(255),
    "passwrd" varchar(255),
    PRIMARY KEY ("id")
);

- peeps - In which all peep information is stored
CREATE TABLE "public"."peeps" (
    "id" int4 NOT NULL DEFAULT nextval('peeps_id_seq'::regclass),
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "user_id" int4,
    "peep" varchar(255) NOT NULL,
    CONSTRAINT "peeps_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id"),
    PRIMARY KEY ("id")
    
## Notes on Progress ##
Created database tables user & peeps

Contain in user are 5 columns
- id- autoincrements to show user id - PRIMARY KEY
- email- stored as VARCHAR(255)
- passwrd - stored as VARCHAR(255)
- name - stored as VARCHAR(255)
- username - stored as VARCHAR(255)

Contained in peep table are 5 columns
- id- autoincramates to show peep id (might be an issue with test autoupdate)
- user_id - foreign key stored at int4 and references users::id - FOREIGN KEY
- created_at - should at initilization of peep autocreate a time stamp in TIMESTAMP format ie YYYY-MM-DD HH:MM:SS
- peep - The content of the peep itself stored in VARCHAR(255)

- ALSO added filepath requirements and named classes. Everything is required and bundled.

## Features ##

- Can add and access users by clicking the Sign Up button on the chitter homepage.
  - When a user is created all information is stored in user column and when returning to the page will be welcomed on the homepage.
- Can post peeps (tweets) and see them appear on the views page
