<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


  <h3 align="center">Lunch and Learn</h3>

  <p align="center">
    The Backend portion of a Service Oriented Architecture application to provide a frontend with API endpoints to consume
  </p>
  <br>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>
<br>



<!-- ABOUT THE PROJECT -->
## Learning Goals

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).
* Implementation of caching
* Implementation of basic authentication

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

[![Rails][Rails.org]][Rails-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

This README makes the assumption that rails is currently active on local machine.
### Installation

1. Clone the repo
   ```sh
   git clone
   https://github.com/neb417/lunch_and_learn
   ```
1. Install gems
   In the main body:
   ```sh
   gem 'bcrypt', '~> 3.1.7'
   gem 'faraday'
   gem 'figaro'
   gem 'jsonapi-serializer'
   gem 'sidekiq'
   ```
   In 'group :development, :test do

   ```sh
   gem 'capybara'
   gem 'factory_bot_rails'
   gem 'faker'
   gem 'launchy'
   gem 'pry'
   gem 'rspec-rails'
   gem 'rspec-sidekiq'
   gem 'shoulda-matchers'
   gem 'simplecov'
   gem 'vcr'
   gem 'webmock'
   ```
1. Enter your API keys
   Run
   ```sh
   $ bundle exec figaro install
   ```
   File config/application.yml should be created and ignored. 
   ```sh
   recipe_app_id: 'ENTER YOUR API'
   recipe_api_key: 'ENTER YOUR API'

   google_api_key: 'ENTER YOUR API'

   unsplash_access_key: 'ENTER YOUR API'
   unsplash_secret_key: 'ENTER YOUR API'

   geo_api_key: 'ENTER YOUR API'
   ```

**Gem Documentation**

[bcrypt][bcrypt-docs]

[Faraday](https://lostisland.github.io/faraday/)

[Figaro](https://github.com/laserlemon/figaro)

[jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

[sidekiq](https://github.com/mperham/sidekiq)

[capybara](https://github.com/teamcapybara/capybara)

[factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)

[faker](https://github.com/faker-ruby/faker)

[launchy](https://github.com/copiousfreetime/launchy)

[pry](https://github.com/pry/pry)

[rspec-rails](https://github.com/rspec/rspec-rails)

[rspec-sidekiq](https://github.com/philostler/rspec-sidekiq)

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)

[simplecov](https://github.com/simplecov-ruby/simplecov)

[vcr](https://github.com/vcr/vcr)

[webmock](https://github.com/bblimke/webmock)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Happy path endpoints to use in Postman running a local server `rails s`

  GET recipes for a random country cuisine
  ```
  /api/v1/recipes
  ```
  or select a country
  ```
  /api/v1/recipes?country=<country of your choice as parameter>
  ```

  GET a video and pictures from a random country
  ```
  /api/v1/learning_resources
  ```
  or select a country
  ```
  /api/v1/learning_resources?country=<country of your choice as parameter>
  ```

  POST a User (name: your name, email: email@example.com, password: password, password_confirmation: password passed in body using JSON)
  ```
  /api/v1/user
  ```

  GET favorite recipes for a user passing 'api_key: <user_api_key>' as JSON in request body
  ```
  /api/v1/favorites
  ```

  DELETE a favorite from user passing 'api_key: <user_api_key>, favorite_id: <favorite.id>' as JSON in request body
  ```
  /api/v1/favorites
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Contact

Benjamin Randolph - [LinkedIn][linkedin-url] - neb417@gmail.com

Project Link: [https://github.com/neb417/lunch_and_learn](https://github.com/neb417/lunch_and_learn)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/neb417/lunch_and_learn/graphs/contributors
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: www.linkedin.com/in/benjamin-randolph-43881a95
[Rails.org]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org

[bcrypt-docs]: https://github.com/bcrypt-ruby/bcrypt-ruby