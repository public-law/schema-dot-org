# frozen_string_literal: true

require_relative 'postal_address'


#
# Model the Schema.org `Thing > Place`.  See http://schema.org/Place
#
module SchemaDotOrg
  class Place < SchemaType
    validated_attr :address, type: union(String, SchemaDotOrg::PostalAddress), presence: true
  end
end
