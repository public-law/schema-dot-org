# frozen_string_literal: true

#
# Model the Schema.org `Thing > Intangible > StructuredValue > ContactPoint > PostalAddress`.
# See https://schema.org/PostalAddress
#
module SchemaDotOrg
  class PostalAddress < SchemaType
    # StreetAddress: The street address. For example, 1600 Amphitheatre Parkway.
    validated_attr :streetAddress,   type: String, allow_nil: true

    # AddressLocality: The locality in which the street address is,
    # and which is in the region. For example, Mountain View.
    validated_attr :addressLocality, type: String, allow_nil: true

    # AddressRegion: The region in which the locality is, and which is in the country.
    # For example, California or another appropriate first-level Administrative division.
    validated_attr :addressRegion,   type: String, allow_nil: true

    # PostalCode: The postal code. For example, 94043.
    validated_attr :postalCode,      type: String, allow_nil: true
  end
end
