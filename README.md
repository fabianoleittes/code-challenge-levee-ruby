<h1 align="center">
   <a href="#"> Code challenge Levee API </a>
</h1>

<h3 align="center">
    Backend Engineer Code Challenge - Levee
</h3>

<p align="center">

<img src="https://api.codeclimate.com/v1/badges/a5c96dc09b0d2eb05768/maintainability" />

<img alt="Testing" src="https://github.com/fabianoleittes/code-challenge-levee-ruby/workflows/Tests%20&%20Linters/badge.svg?branch=main">

  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/fabianoleittes/code-challenge-levee-ruby?color=%2304D361">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/fabianoleittes/code-challenge-levee-ruby">

  <a href="https://github.com/fabianoleittes/code-challenge-levee-ruby/commits/main">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/fabianoleittes/code-challenge-levee-ruby">
  </a>

   <img alt="License" src="https://img.shields.io/badge/license-MIT-brightgreen">
   <a href="https://github.com/fabianoleittes/code-challenge-levee-ruby/stargazers">
    <img alt="Stargazers" src="https://img.shields.io/github/stars/fabianoleittes/code-challenge-levee-ruby?style=social">
  </a>
</p>


<h4 align="center">
	 Status: WIP
</h4>

<p align="center">
 <a href="#about">About</a> •
 <a href="#features">Features</a> •
 <a href="#how-it-works">How it works</a> •
 <a href="#tech-stack">Tech Stack</a> •
 <a href="#author">Author</a> •
 <a href="#license">License</a>

</p>

## About

This project is a simple API for some `Job` routines, such as creating, listing, and activate.

---

## Features

- [x] Create job
- [x] List the all jobs
- [x] Activate the status for a specific job
- [x] List the percentage and number of active jobs by category.
- [x] JWT Token Based Authentication
- [x] API versioning
- [x] JSON Schema implementation
- [x] Setup scripts

---

## How it works

This project is Restful API:
1. Backend


### Pre-requisites

Before you begin, you will need to have the following tools installed on your machine:
[docker](https://docs.docker.com/install/), [docker compose](https://docs.docker.com/compose/install/), [Git](https://git-scm.com).

In addition, it is good to have an editor to work with the code like [VSCode](https://code.visualstudio.com/)

#### Running the Backend (server)

```bash

# Clone this repository
$ git clone https://github.com/fabianoleittes/code-challenge-levee-ruby

# Access the project folder cmd/terminal
$ cd code-challenge-levee-ruby

# building the project
$ docker-compose build

# Run the application in development mode
$ docker-compose up

# The server will start at port: 3000 - go to http://localhost:3000

# Run tests in container
$ docker-compose run --rm api bin/rspec spec

```

#### API Request

### Signup/Login

| URL / ENDPOINT          | VERB | DESCRIPTION      |
| ----------------------- | ---- | ---------------- |
| /v1/signup              | POST | Create user      |
| /v1/auth/login          | POST | Generate token   |

### Jobs
| URL / ENDPOINT          | VERB | DESCRIPTION      |
| ----------------------- | ---- | ---------------- |
| /v1/jobs | POST | Create Job      |
| /v1/jobs      | GET  | Returns all Job |
| /v1/jobs/:id  | PUT  | Update Job Status |
| /v1/category/:id  | GET  | List percentage |
---

## Test endpoints `API` using Insomnia

<p align="center">
  <a href="https://insomnia.rest/run/?label=Levee%20code%20challenge%20API&uri=https%3A%2F%2Fraw.githubusercontent.com%2Ffabianoleittes%2Fcode-challenge-levee-ruby%2Fmain%2Fexport.json" target="_blank"><img src="https://insomnia.rest/images/run.svg" alt="Run in Insomnia"></a>
</p>

---
## Tech Stack

The following tools were used in the construction of the project:

#### **API**  ([Ruby on Rails](https://rubyonrails.org/)  +  [PostgreSQL](https://www.postgresql.org/))

-   **[rspec](https://github.com/rspec/rspec-rails)**
-   **[Factory Bot](https://github.com/thoughtbot/factory_bot_rails)**
-   **[Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)**
-   **[JWT](https://github.com/jwt/ruby-jwt)**
-   **[ffaker](https://github.com/ffaker/ffaker)**
-   **[Rack Cors](https://github.com/cyu/rack-cors)**

> See more  [Gemfile](https://github.com/fabianoleittes/mob2con-challenge-ruby/blob/main/Gemfile)

**Utilities**


-   Commit Conventional:  **[Commitlint](https://github.com/conventional-changelog/commitlint)**
-   API Test:  **[Insomnia](https://insomnia.rest/)**
---

## Author

<a href="https://fabianoleittes.me/">
 <img style="border-radius: 50%;" src="https://avatars3.githubusercontent.com/u/279344?v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Fabiano Leite</b></sub></a>
 <br />

[![Twitter Badge](https://img.shields.io/badge/-@fabianoleittes-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/fabianoleittes)](https://twitter.com/fabianoleittes) [![Linkedin Badge](https://img.shields.io/badge/-Fabiano-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/fabianoleittes/)](https://www.linkedin.com/in/fabianoleittes/)

---

## License 📝

This project is under the license [MIT](./LICENSE).

##### Made with love by Fabiano Leite 👋🏽 [Get in Touch!](Https://www.linkedin.com/in/fabianoleittes/)
---
