# frozen_string_literal: true


module SchemaDotOrg
  ##
  # Model the Schema.org `Thing > Intangible > Language`.
  # See https://schema.org/Language
  #
  class Language < SchemaType
    validated_attr :alternateName, type: String, allow_nil: true
    validated_attr :name,          type: String, presence: true
  end
end
