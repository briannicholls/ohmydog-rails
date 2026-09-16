# README

Ohmydog-rails is a web application for managing the back end of a dog walking business. It allows you to keep track of your employees, customers, pets, and walks.

Requires **Ruby 3.4.10** and **Rails 8.1**.

Current goals for this project are:

- add an admin panel for better control of users and their roles (right now all actions are at the admin access level)
- add support for making walks recurring
- add support for receipts, allowing a Rate to be assigned to an owner so that we can keep track of balances and what walks have been paid for
- add image upload support for pets
- stretch goal: create client-facing portions of the site, possibly allowing customers to schedule walks

Blog post: http://briannicholls.home.blog/2020/03/21/my-first-rails-project-managing-a-dog-walking-business/

Video walkthrough: https://youtu.be/dOP1iZg9ntE

# Installation

Download the repo, and inside the directory run `bundle install`.

In order to log in with Google, you will need to create OAuth credentials in Google Cloud Console. Put `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` in a `.env` file per the instructions for the dotenv-rails gem. Authorized redirect URIs:

```
http://localhost:3000/users/auth/google_oauth2/callback
https://app.ohmydognyc.com/users/auth/google_oauth2/callback
```

Create a PG user `ohmydog` for the application to use:

```sql
CREATE USER ohmydog WITH PASSWORD 'your_chosen_password';
```

Set these values in a `.env` file. See `.env.sample`.

Run `bin/rails db:prepare` to initialize the database, then `bin/rails db:seed` if you want sample data.

Start the server locally with `bin/dev`.

# Usage

You will be directed to the welcome screen where you can create your account.

By default, new users are given the attribute `role: employee`, but this has no consequence in the current version. You will still be able to perform all actions.

Pets, Owners, and Walks can be viewed and created in their respective views via the nav bar.

# License

Copyright (C) 2020 Brian Nicholls

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
