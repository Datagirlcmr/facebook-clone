
# Facebook Clone

>  This project is a Facebook-like social network application built with rails. It implements the basic functionality found on the popular social media app called Facebook.
<!-- ![screenshot](./docs/image.png) -->

The objetive of this project is build a replica that uses all the core logic of Facebook.

## About the Project

This project is a Facebook-like social network application. In this project, users can sign up either through the app or with their facebook account. Once a user becomes a member, such user can be able to create posts and comments on other posts and in which only his/her friends can see and view. A user can also be able to post images too. A user can friend or unfriend a user. The main goal is to put in practice the main concepts of Model Associations, Session Authentications with devise gem, and units & integration testing with RSpec and Capybara.

## Features

- Users can signup and send friend requests to other users.
- Posts are created by users and only a user's friend can view or see them.
- User can comment can on his/her post or on other users post.
- Users can like posts and comments.
- Users can search for other users with the search input by their names.

## Data Architecture Documentation (ERD)

The image below is a copy of the Entity Relationship Diagram generated for this project.

[screenshot](./docs/OBaVg52wtTZ.png)

## Built With

- Ruby language,
- Ruby on Rails framework,
- Vscode for coding
- Rubocop for Validation

## Live Demo

[Live Demo Link](https://afternoon-mesa-55417.herokuapp.com)

=======

# Gems
- devise
- omniauth-facebook
- capybara
- rspec-rails

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*The Odin Project*](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project).
## Authors

👤 **Selma Ndi**

- Github: [@githubhandle](https://github.com/Datagirlcmr)
- Twitter: [@twitterhandle](https://twitter.com/SelmaNdi)
- Linkedin: [linkedin](https://www.linkedin.com/in/selma-ndi-datagirl-imba-8976ab32/)

👤 **Vinicius Carvalho**

- Github: [@githubhandle](https://github.com/kazumaki)
- Twitter: [@twitterhandle](https://twitter.com/iKazumaki/)
- Linkedin: [linkedin](https://www.linkedin.com/in/vinicius-campos-carvalho-3526a1192/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Datagirlcmr/facebook-clone/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- MicroverseInc(https://www.microverse.org/)
- Odin Project(https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)


## 📝 License

This project is [MIT](lic.url) licensed.
