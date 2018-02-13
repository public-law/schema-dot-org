require 'schema_dot_org'


module SchemaDotOrg
  # Model the Schema.org `Thing > Place`.  See http://schema.org/Place
  class Place < SchemaType
    attr_accessor :address
    validates :address, type: String, presence: true

    def to_json_struct
      {
        "@type" => "Place",
        address: self.address
      }
    end
  end
end