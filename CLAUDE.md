# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Ruby gem that generates structured data (JSON-LD) for Schema.org types. It provides strongly-typed Ruby classes that validate their attributes and output valid Schema.org markup for SEO and search enhancement.

## Development Commands

### Testing
- `bundle exec rake spec` or `bundle exec rspec` - Run all RSpec tests
- `bundle exec rspec spec/schema_dot_org/[type]_spec.rb` - Run tests for a specific Schema.org type
- `bundle exec rake` - Run default task (runs tests)

### Gem Management  
- `gem build schema_dot_org.gemspec` - Build the gem locally
- `gem install ./schema_dot_org-[version].gem` - Install built gem locally
- `bundle install` - Install dependencies

### Interactive Development
- `bundle exec pry` - Start Pry REPL with gem loaded for interactive testing

## Architecture

### Core Components

**SchemaType Base Class** (`lib/schema_dot_org.rb`):
- Abstract base class for all Schema.org types
- Handles JSON-LD generation with `to_json_ld()` and `to_s()` methods
- Converts snake_case Ruby attributes to camelCase JSON-LD
- Provides validation through ValidatedObject gem integration
- Automatically adds `@context` and `@type` fields

**Schema.org Type Classes** (`lib/schema_dot_org/*.rb`):
- Each file represents one Schema.org type (Organization, Person, BreadcrumbList, etc.)
- Classes inherit from SchemaType and use `validated_attr` for type-safe attributes
- Follow pattern: `validated_attr :attribute_name, type: [Type], allow_nil: true/false`

**URL Validation** (`lib/schema_dot_org/url_validator.rb`):
- Validates URLs used in structured data
- Used by convenience methods like `make_breadcrumbs`

### Design Patterns

**Validation-First Approach**: 
- All attributes are validated at object creation time
- Invalid data causes immediate ArgumentError/NoMethodError rather than silent failures
- Uses ActiveRecord-style validations via ValidatedObject gem

**Declarative Attribute Definition**:
```ruby
class Product < SchemaType
  validated_attr :name,        type: String
  validated_attr :description, type: String, allow_nil: true
  validated_attr :offers,      type: SchemaDotOrg::AggregateOffer
end
```

**Nested Schema Types**:
- Schema types can reference other schema types as attributes
- Automatic JSON-LD nesting handled by base class
- Example: Organization can have Person founder, Place founding_location

### Key Files Structure

- `lib/schema_dot_org.rb` - Main module, base SchemaType class, convenience methods
- `lib/schema_dot_org/[type].rb` - Individual Schema.org type implementations  
- `spec/schema_dot_org/[type]_spec.rb` - RSpec tests for each type
- `spec/spec_helper.rb` - RSpec configuration with doctest2 integration

### Testing Patterns

- Each Schema.org type has corresponding RSpec test file
- Tests validate both successful creation and error conditions
- Tests verify correct JSON-LD output format
- Uses doctest2-rspec for testing code examples in comments

## Adding New Schema.org Types

1. Create new file `lib/schema_dot_org/new_type.rb`
2. Define class inheriting from SchemaType with validated_attr declarations
3. Add require statement to main `lib/schema_dot_org.rb` file
4. Create corresponding test file `spec/schema_dot_org/new_type_spec.rb`
5. Follow existing patterns for validation and JSON-LD output testing

## Dependencies

- **validated_object (~> 2.3)** - Provides ActiveRecord-style validations
- **rspec (~> 3.12)** - Testing framework
- **doctest2-rspec (~> 0.9.2)** - Tests code examples in documentation