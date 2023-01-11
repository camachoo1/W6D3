# First Routes & Controllers

In this project you'll start playing with Rails routing.

## Learning Goals

- Be able to create routes in __config/routes.rb__
- Be able to read and understand Rails server error messages
- Know the three places that `params` come from
- Be able to nest query parameters
- Be able to write controller actions that read from and write to the database
- Know how and when to render errors

## Rails Diagram

As you work through the project, revisit this diagram at each phase and discuss
with your pair how the code you've written so far fits into the relationships
displayed here.

- ![Rails Diagram][diagram]

## Phase 0: Setup

To start, generate a new, blank Rails project: `rails new <project_name>
<flags>`. Don't forget to add flags to:

1. Set PostgreSQL as the database,
2. Skip setting up the project as a Git repo,
3. Skip setting up the Rails testing framework, and
4. Install a minimal build.

Grab the __.gitignore__ and __.gitattributes__ files from the starter repo at
the `Download Project` button below and copy them into the root directory of
your project.

If you prefer to use `byebug` instead of `debug` as your debugger, then replace
`debug` with `byebug` in your Gemfile. Add any other gems you want to install
(e.g., `annotate`, `pry-rails`, `better_errors`, and `binding_of_caller`).  If
you make any changes to your Gemfile, run `bundle install` to incorporate them
into your project.

Next, set up your Postgres database by running `rails db:create`.

By default, Rails protects against a type of attack known as Cross-Site Request
Forgery (CSRF) by checking that non-GET requests include a valid _authenticity
token_. Don't worry about that for now. For this particular assignment, go to
__config/application.rb__. Right after the `config.load_defaults X.X` line, add:

```rb
config.action_controller.default_protect_from_forgery = false
```

Adding this line ensures that you won't need to include an authenticity token in
your `POST` request params; you'll learn what that means later. (Once you know
how to add authenticity tokens to your requests, you won't need to add this line
to your projects.)

## Phase I: First routes

You're now ready to generate your first routes! Go to __config/routes.rb__ and
add the following line inside the `Rails.application.routes.draw` block:

```ruby
resources :users
```

Remember that this one line actually generates **eight routes** for you. Run
`rails routes` to see what those routes are.

Woohoo! You've set up your first eight _API endpoints_. Each route you have is
an API endpoint, which encapsulates a single action your app can take.

Look again at the left-most column, which displays the prefix for a route. Rails
uses these prefixes to generate the helper methods `<prefix>_path` and
`<prefix>_url` that you can use in your code to generate a route's path and url,
respectively. In addition to making your code more readable, these methods also
make it easier to maintain your code: if a route changes, the helper methods
will automatically generate the new path/url everywhere they appear. You will
learn more about these helper methods and their uses later.

You may notice that some of the routes seem to be missing prefixes. This is
because prefixes are based on a route's **path**, not its **verb**. All routes
with the same path will share the same prefix, meaning that a prefix does not
need to be listed more than once for any given path. So, e.g., the `index`
route--a `GET` request to `users/`--and the `create` route--a `POST` request to
`users/`--will both have the prefix `users`, even though the prefix only appears
next to the `index` route.

The ease with which Rails converts that one `resources` line into eight routes
might seem like magic, but you can do it too. Try the following:

- Comment out the `resources :users` line.
- Write out the eight routes using the route 'matching' syntax. For example:
  `get 'users/:id', to: 'users#show', as: 'user'`.

Run `rails routes` again and check that the routes you've written match the
routes generated by the `resources` helper exactly. __N.B.__: you'll probably
see some differences in the prefixes listed for your routes. Again, try to match
the `resources` output exactly. You can add a prefix to a route by using the
`as` option. For example: `get 'users/new', to: 'users#new', as: 'new_user'`.
Remember, too, that you don't need to specify a prefix more than once for any
given **path**.

What do these routes actually do? Starting your Rails server creates an instance
of a _router_. This router holds instances of the _routes_ that are defined in
your __routes.rb__ file. When a request comes in, the router tries to match a
route based on the **HTTP method** and the **URL path**. (It does this with a
_regular expression_, if you know what that is already.) The **first** matched
route then instantiates an instance of the specified controller and calls the
specified action on it.

You now have the initial routes and endpoints necessary to manage a `User`
resource. Notice, though, that your routes point to a `UsersController`, which
you don't actually have yet. Nor do you have a `User` model. You'll add the
model later. (Soon!)

Next up: the controller!

[diagram]: https://assets.aaonline.io/fullstack/rails/assets/rails_diagram.png# W6D3
