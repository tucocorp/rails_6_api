class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :description, :image_url, :status, :business_id

  def id
    self.object.id.to_s
  end

  def business_id
    self.object.business_id.to_s
  end
end
