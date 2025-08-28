# frozen_string_literal: true

#
# Model the Schema.org `Thing > Intangible > StructuredValue > ContactPoint > PostalAddress`.
# See https://schema.org/PostalAddress
#
module SchemaDotOrg
  class PostalAddress < SchemaType

    # AddressCountry: The country. Recommended to be in 2-letter ISO 3166-1 alpha-2
    # format, for example "US". For backward compatibility, a 3-letter ISO 3166-1 alpha-3
    # country code such as "SGP" or a full country name such as "Singapore" can also be
    # used.
    validated_attr :addressCountry,  type: String, allow_nil: true

    # AddressLocality: The locality in which the street address is,
    # and which is in the region. For example, Mountain View.
    validated_attr :addressLocality, type: String, allow_nil: true

    # AddressRegion: The region in which the locality is, and which is in the country.
    # For example, California or another appropriate first-level Administrative division.
    validated_attr :addressRegion,   type: String, allow_nil: true

    # ExtendedAddress: An address extension such as an apartment number, C/O or
    # alternative name.
    validated_attr :extendedAddress, type: String, allow_nil: true

    # PostalCode: The postal code. For example, 94043.
    validated_attr :postalCode,      type: String, allow_nil: true

    # StreetAddress: The street address. For example, 1600 Amphitheatre Parkway.
    validated_attr :streetAddress,   type: String, allow_nil: true
  end
end
