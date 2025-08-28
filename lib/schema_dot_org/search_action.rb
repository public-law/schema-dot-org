# frozen_string_literal: true


module SchemaDotOrg
  ##
  # Model the Schema.org `Thing > SearchAction`.  See http://schema.org/SearchAction
  #
  class SearchAction < SchemaDotOrg::SchemaType
    validated_attr :query_input, type: String, presence: true
    validated_attr :target,      type: String, presence: true
  end
end
