# frozen_string_literal: true


module SchemaDotOrg
  ##
  # Model the Schema.org `Thing > Intangible > Offer`.  See https://schema.org/Offer
  #
  class Offer < SchemaType
    validated_attr :priceCurrency, type: String
    validated_attr :price,         type: Numeric
    validated_attr :availability,  type: String, allow_nil: true
    validated_attr :url,           type: String, allow_nil: true
  end
end
