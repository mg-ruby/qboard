require 'types'

class ApplicationModel < ROM::Struct
  def self.inherited(klass)
    super

    klass.extend ActiveModel::Naming
    klass.include ActiveModel::Conversion

    klass.constructor_type :schema

    klass.attribute :id, Types::Strict::Int.optional.meta(primary_key: true)
  end

  def persisted?
    id.present?
  end
end