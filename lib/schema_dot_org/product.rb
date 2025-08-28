# frozen_string_literal: true


module SchemaDotOrg
  ##
  # Model the Schema.org `Thing > Product`.  See https://schema.org/Product
  #
  class Product < SchemaType
    validated_attr :description,  type: String, allow_nil: true
    validated_attr :image,        type: Array,  allow_nil: true
    validated_attr :name,         type: String
    validated_attr :offers,       type: SchemaDotOrg::AggregateOffer
    validated_attr :url,          type: String
  end
end
