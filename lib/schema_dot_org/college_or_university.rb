# frozen_string_literal: true


module SchemaDotOrg
  ##
  # https://schema.org/CollegeOrUniversity
  #
  class CollegeOrUniversity < SchemaType
    validated_attr :name, type: String, presence: true
    validated_attr :url,  type: String, allow_nil: true
  end
end
