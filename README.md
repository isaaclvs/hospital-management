# Medical Office Management System

Web system developed in Ruby on Rails for patient management in medical offices, with specific portals for receptionists and doctors.

## 🚀 Features

### Receptionist Portal
- Register new patients
- Complete patient management (CRUD)
- Patient list view

### Doctor Portal
- View registered patients
- Statistical dashboard with graphs
  - Number of patients registered per day
  - Temporal registration analysis

### General
- Unified authentication system
- Responsive interface with Tailwind CSS
- Role-based authorization (Pundit)

## 📋 System Requirements

- Ruby 3.x
- Rails 8.0.0
- PostgreSQL
- Node.js (for assets)

## 🔧 Installation

1. Clone the repository
`git clone https://github.com/isaaclvs/hospital-management.git`

2. Install dependencies
`bundle install`

3. Install Node.js dependencies
`npm install`

4. Setup database
`rails db:setup`
`rails db:create`
`rails db:migrate`

5. Start the server
`bin/dev`

## 🛠️ Built With

* [Ruby on Rails 8.0.0](https://rubyonrails.org/) - Web Framework
* [PostgreSQL](https://www.postgresql.org/) - Database
* [Devise](https://github.com/heartcombo/devise) - Authentication
* [Pundit](https://github.com/varvet/pundit) - Authorization
* [Tailwind CSS](https://tailwindcss.com/) - CSS Framework
* [Chartkick](https://chartkick.com/) - Chart Generation
* [RSpec](https://rspec.info/) - Testing Framework

## 🧪 Running Tests

`bundle exec rspec`
## 👥 User Roles

## 📊 Project Structure

```
project_root/
├── app/
│ ├── controllers/ # Request handling logic
│ ├── models/ # Database models and business logic
│ ├── views/ # Templates and frontend files
│ │ ├── layouts/
│ │ ├── doctors/
│ │ └── receptionists/
│ ├── policies/ # Pundit authorization policies
│ ├── services/ # Business service objects
│ └── assets/ # Frontend assets
│ ├── stylesheets/
│ └── javascript/
│
├── config/ # Application configuration
├── db/ # Database files and migrations
├── spec/ # Test files
│ ├── models/
│ ├── controllers/
│ └── features/
│
├── Gemfile # Ruby dependencies
├── package.json # Node.js dependencies
└── README.md # Project documentation
```

## 🔐 Environment Variables

Create a `.env` file in the project root with the following variables:

`DATABASE_URL=postgresql://localhost/database_name`

## 👥 User Roles

- **Receptionist**: Complete patient management
- **Doctor**: Patient viewing and statistical analysis

## 📝 License

This project is licensed under the [MIT](LICENSE.md) License.
