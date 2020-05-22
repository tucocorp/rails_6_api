class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :category_extras, :sub_categories

  def id
    self.object.id.to_s
  end

  def category_extras
    self.object.category_extras.map{ |c| CategoryExtraSerializer.new(c) } if self.object.category_extras.present?
  end

  def sub_categories
    self.object.sub_categories.map{ |c| SubCategorySerializer.new(c) } if self.object.sub_categories.present?
  end
end
