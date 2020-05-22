class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_contact, :description, :status, :role, :stores, :categories

  def id
    self.object.id.to_s
  end

  def role
    Role.get_role(current_user.id, self.object.id)
  end

  # has_many :products

  def stores
    params = {}
    params[:stores] = self.object.stores
    params[:user] = current_user
    params[:stores_ids] = current_user.entity_roles_ids(:admin_store)
    Fetchers::FetchStoresService.serializer(params) if params[:stores].present?
  end

  def categories
    self.object.categories.map{ |c| CategorySerializer.new(c) } if self.object.categories.present?
  end
end
