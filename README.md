# Cat Cafe

A modern Rails 8 application for managing a cat cafe business.

## Prerequisites

* Ruby 3.x
* PostgreSQL
* Node.js
* Yarn/npm

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Baileybk2/cat_cafe.git
   cd cat_cafe
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # if you want sample data
   ```

## Running the Application

1. Start the application using Foreman (this will start all necessary processes):
   ```bash
   foreman start -f Procfile.dev
   ```

2. Visit [http://localhost:3000](http://localhost:3000) in your browser

## Running Tests

The application uses RSpec for testing. To run the test suite:

```bash
bundle exec rspec
```

## Development

- This application uses Bootstrap 5 for styling
- Asset compilation is handled by Propshaft
- Uses Hotwire (Turbo and Stimulus) for dynamic features
- Image processing is available through Active Storage

### Asset Precompilation
When adding new images or other assets to the application, make sure to run:
```bash
rails assets:precompile
```

## Services

- Database: PostgreSQL
- Cache: SolidCache
- Background Jobs: SolidQueue
- WebSocket: SolidCable

## Deployment

This application is configured for deployment using Kamal and Docker. See the `config/deploy.yml` for deployment configuration.

To deploy:
```bash
bundle exec kamal deploy
```

## Docker

To run the application using Docker:

1. Build the image:
   ```bash
   docker build -t cat_cafe .
   ```

2. Run the container:
   ```bash
   docker run -p 3000:3000 cat_cafe
   ```


