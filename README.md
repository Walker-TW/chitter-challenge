<br/>
<div align="center">

[![MIT License][license-shield]][license-url]
[![Ruby commits][rubyCommits]](https://sourcerer.io/walker-tw)
[![Rspec][rspec]](https://sourcerer.io/walker-tw)
[![CSS commits][cssCommits]](https://sourcerer.io/walker-tw)
[![HTML commits][htmlCommits]](https://sourcerer.io/walker-tw)
[![postgresql commits][sqlCommits]](https://sourcerer.io/walker-tw)
[![LinkedIn][linkedin-shield]][linkedin-url]

</div>
<p align="center">
  <a href="https://github.com/walker-tw/chitter">
      <img src="https://image.flaticon.com/icons/svg/1596/1596833.svg" width="80" height="80" alt="icon">
  </a>

  <h3 align="center">Chitter</h3>

  <p align="center">
    Chitter will take all tweets given by multiple users and then displays them as capitals.     
  </p>
</p>

<div align= "center">

  [*About The Project*](#About-The-Project)| [*Getting Started*](#Getting-Started) | [*Database Creation Commands*](#Database-Creation-SQL-Commands) | [*Notes On Databases*](#Notes-on-Databases) | [*Features*](#Features) | [*License*](#license)

</div>

## About The Project

Chitter will store all the information of the peeps (tweets) in a local database and it is possible in a SQL interface to list all available tweets by a certain user.

You can also sign up to Chitter, store you own peeps and even create some to be posted to the database.

This was all created using an MVC model and has been built on the front-end using HTML, controller side using Sinatra and Ruby and finally the database's are built using SQL and interfaced with via the rubygem 'pg'.

## Getting Started

1. Create the Databases listed below

2. Run bundle within the terminal. 

```sh
bundle
```

3. Finally launch the app either through the command 'rackup' or 'ruby app.rb'.

```sh
rackup
```

4. Visit [http://localhost:9292/chitter](http://localhost:9292/chitter)


AND ENJOY!

## Database Creation SQL Commands ##

- Please note if run in test mode then the rspec/Capybara tests will look for a test database named 'chitter_test'

- users - In which all users are stored
CREATE TABLE "public"."users" (
    "id" SERIAL PRIMARY KEY,
    "email" varchar(60),
    "username" varchar(255),
    "realname" varchar(255),
    "passwrd" varchar(255)
);

- peeps - In which all peep information is stored
CREATE TABLE "public"."peeps" (
    "id" SERIAL PRIMARY KEY,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "user_id" int4,
    "peep" varchar(255) NOT NULL,
    CONSTRAINT "peeps_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id")
);
    
## Notes on Databases ##

Two tables named users & peeps.

Contained in users is 5 columns
- id- auto increments to show user id - PRIMARY KEY
- email- stored as VARCHAR(255)
- passwrd - stored as VARCHAR(255)
- name - stored as VARCHAR(255)
- username - stored as VARCHAR(255)

Contained in the peeps table are 5 columns
- id- auto increments to show peep id (might be an issue with test autoupdate)
- user_id - foreign key stored at int4 and references users::id - FOREIGN KEY
- created_at - should at initilization of peep autocreate a time stamp in TIMESTAMP format ie YYYY-MM-DD HH:MM:SS
- peep - The content of the peep itself stored in VARCHAR(255)

- ALSO added filepath requirements and named classes. Everything is required and bundled.

## Features ##

- Can add and access users by clicking the Sign Up button on the chitter homepage.
  - When a user is created all information is stored in user column and when returning to the page will be welcomed on the homepage.
- Can post peeps (tweets) and see them appear on the views page

## License

Distributed under the MIT License. See `LICENSE` for more information.

[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/thomas-w-walker 
[rubyCommits]: https://img.shields.io/badge/Ruby-red.svg
[rspec]: https://img.shields.io/badge/Rspec-yellow.svg
[cssCommits]: https://img.shields.io/badge/CSS-green.svg
[htmlCommits]: https://img.shields.io/badge/HTML-orange.svg
[sqlCommits]: https://img.shields.io/badge/Postgresql-blue.svg
