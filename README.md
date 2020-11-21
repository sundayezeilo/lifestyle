# Lifestyle articles website: Ruby on Rails Capstone Project

> This is an implementation of Microverse Ruby on Rails capstone project.

> The full project description can be found [here](https://www.notion.so/Lifestyle-articles-b82a5f10122b4cec924cd5d4a6cf7561#6143e0b8b3ca4a9db55ec7ffbc4e2c3a).


##  What I built

* A website where articles of selected categories can be posted.

* Article authors must have and account and get authenticated through login, anytime they want to use the site.

* A logged-in author can see featured articles and also post a new article via the user interface.

* A user can also vote or unvote (if he previusly voted) an article of his choice. A featured article is the one that is most voted.


##  Environments/System dependencies

* Ruby version  - 2.7.1

* Rails version - 6.0.3.4

* Test Suite: RSpec/Capybara

* PostgreSQL database is required to be installed and configured on the local machine. Check this [tutorial](https://www.postgresqltutorial.com/install-postgresql/) for help.

* All the required gems are bundled in the Gemfile.


##  Setup

* Configuration - from the project directory, run``` bundle install ```from command line (terminal) to install all the required gems.

* Run ```yarn install --check-files``` from root

* Database creation - After cloning the project, navigate to the project directory (```cd lifestyle-ror-capstone```), then execute the following commands``` rails db:create ```, then ``` rails db:migrate ```and ```rails db:seed``` to create and migrate database on the local machine.

* Run ```rails db:seed``` to push some included sample data to the database.

* Test the app using RSpec by running ```bundle exec rspec``` in the root directory.

* Start Rails sever by running the command ```rails sever``` or ```rails s``` in the root directory.

* Open the web browser and type  'localhost:3000' in the address bar.

* All the features are implemented in the user interface.


### You can also check out the Live version of the App [here](https://iotpost.herokuapp.com).


## Author

👤 **Sunday Uche Ezeilo**

- Github: [@sundayezeilo](https://github.com/ezeilo-su)
- Twitter: [@SundayEzeilo](https://twitter.com/SundayEzeilo)
- Linkedin: [Sunday Ezeilo](https://www.linkedin.com/in/sunday-ezeilo-a6a67664/)

## 🤝 Contributing

Contributions, issues and feature requests will be appreciated.

Feel free to check the [issues page](https://github.com/ezeilo-su/lifestyle-ror-capstone/issues)

## Show your support

Show support by giving a ⭐️ if you like this project!


## ⭐️⭐️⭐️⭐️⭐️

##  🤝 Design Credit to [Nelson Sakwa Behance](https://www.behance.net/sakwadesignstudio) for this very creative UI.