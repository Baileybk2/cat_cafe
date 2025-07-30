# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Cat Cafe is a Ruby on Rails 8.0.2 application for managing a cat cafe business. Currently in early development with static pages and modern Rails conventions.

## Key Technologies & Architecture

- **Ruby on Rails 8.0.2** with PostgreSQL
- **HAML templates** (not ERB) - all views use `.html.haml`
- **Bootstrap 5.3.0** with custom SCSS styling
- **Propshaft asset pipeline** (not Sprockets) 
- **RSpec testing** (not Minitest)
- **Hotwire** (Turbo + Stimulus) for dynamic features
- **Solid services** (SolidCache, SolidQueue, SolidCable) for production

## Development Commands

```bash
# Start development server with asset watching
foreman start -f Procfile.dev

# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/system/site_layouts_spec.rb

# Watch and compile SCSS
bin/rails dartsass:watch

# Generate controller with HAML views
rails generate controller ControllerName action1 action2

# Database operations
rails generate migration MigrationName
rails db:migrate
```

## Current Application Structure

**Routes:** Simple static pages setup
- Root: `static_pages#home`
- `/help`, `/about`, `/contact` → `static_pages` controller

**Database:** Empty schema (no migrations run yet)

**Styling:** Custom Bootstrap 5 theme with pink/coral branding (`#fc216a`, `#fc4c38`)

## Important Conventions

### Template Engine
- **Use HAML for all views**, not ERB
- Existing partials: `_header.html.haml`, `_footer.html.haml`

### Responsive Testing
- Navigation links are in collapsible mobile menu
- System tests must click `.navbar-toggler` to access nav links in mobile view

### Asset Pipeline
- SCSS compilation via `dartsass-rails`
- Import maps for JavaScript (no Webpack)
- Custom styles in `app/assets/stylesheets/custom.scss`

### Testing Strategy
- **RSpec with Capybara** for system tests
- Mobile-responsive UI testing patterns established
- Test files in `spec/system/` and `spec/requests/`

## Architecture Notes

This is a modern Rails 8 application with:
- Multiple database configuration for production scaling
- Kamal deployment ready with Docker
- Modern browser requirements enforced
- Bootstrap 5 fully integrated with custom branding

The codebase follows Rails 8 conventions and is ready for feature development with established patterns for responsive UI, testing, and deployment.