class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :phone_contact, :address, :image_url, :status

  def id
    self.object.id.to_s
  end

  def business_id
    self.object.business_id.to_s
  end
end
