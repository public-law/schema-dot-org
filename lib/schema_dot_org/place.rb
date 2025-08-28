# frozen_string_literal: true

require_relative 'postal_address'


module SchemaDotOrg
  ##
  # Model the Schema.org `Thing > Place`.  See http://schema.org/Place
  #
  class Place < SchemaType
    validated_attr :address, type: union(String, SchemaDotOrg::PostalAddress), presence: true
  end
end
