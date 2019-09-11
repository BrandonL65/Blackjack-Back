class ChipSerializer < ActiveModel::Serializer
  attributes :id, :amount, :user
  has_one :user
end
