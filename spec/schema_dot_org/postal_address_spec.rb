# frozen_string_literal: true

require 'spec_helper'
require 'schema_dot_org'

RSpec.describe SchemaDotOrg::PostalAddress do
  let(:postal_address) do
    SchemaDotOrg::PostalAddress.new(
      addressCountry:  "US",
      addressLocality: "Seattle",
      addressRegion:   "WA",
      postalCode:      "98052",
      streetAddress:   "20341 Whitworth Institute 405 N. Whitworth"
    )
  end

  describe '#to_json_struct' do
    it 'has the correct attributes and values' do
      # From https://schema.org/PostalAddress
      expect(postal_address.to_json_struct).to eq(
        '@type'           => 'PostalAddress',
        "addressCountry"  => "US",
        "addressLocality" => "Seattle",
        "addressRegion"   => "WA",
        "postalCode"      => "98052",
        "streetAddress"   => "20341 Whitworth Institute 405 N. Whitworth"
      )
    end
  end
end
