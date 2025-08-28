# frozen_string_literal: true

module SchemaDotOrg
  ##
  # Model the Schema.org `Thing > Intangible > StructuredValue > InteractionCounter`.
  # See https://schema.org/InteractionCounter
  #
  class InteractionCounter < SchemaType
    validated_attr :userInteractionCount, type: Integer, presence: true
    validated_attr :interactionType,      type: String,  presence: true
  end
end
