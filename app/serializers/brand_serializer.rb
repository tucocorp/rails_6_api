class BrandSerializer < ActiveModel::Serializer
  attributes :id, :name

  def id
    self.object.id.to_s
  end
end
