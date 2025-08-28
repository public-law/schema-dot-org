# frozen_string_literal: true

require 'date'

require_relative 'person'
require_relative 'place'
require_relative 'postal_address'


module SchemaDotOrg
  ##
  # See https://schema.org/Organization
  #
  class Organization < SchemaType
    validated_attr :address,           type: PostalAddress,                       allow_nil: true
    validated_attr :contact_points,    type: union(ContactPoint, [ContactPoint]), allow_nil: true
    validated_attr :email,             type: String,                              allow_nil: true
    validated_attr :founder,           type: Person,                              allow_nil: true
    validated_attr :founding_date,     type: Date,                                allow_nil: true
    validated_attr :founding_location, type: Place,                               allow_nil: true
    validated_attr :legal_name,        type: String,                              allow_nil: true
    validated_attr :same_as,           type: union(String, [String]),             allow_nil: true
    validated_attr :slogan,            type: String,                              allow_nil: true
    validated_attr :telephone,         type: String,                              allow_nil: true

    ########################################
    # Attributes that are required by Google
    ########################################
    validated_attr :logo,              type: String
    validated_attr :name,              type: String
    validated_attr :url,               type: String
  end
end
