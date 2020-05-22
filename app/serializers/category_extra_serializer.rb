class CategoryExtraSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :category_extra_values

  def id
    self.object.id.to_s
  end
end
