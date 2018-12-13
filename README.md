# Rails Final Project: Facebook

Made in response of one of [The Odin Project](https://www.theodinproject.com) [assignments](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project).

Assignment description:

> Build Facebook! You’ll build a large portion of the core Facebook
> user functionality in this project. We won’t be worrying about the
> Javascript-heavy front end stuff but you won’t need it to get a nice
> user experience.

## Getting started

To get started with the app, clone the repository and then install the needed gems:

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