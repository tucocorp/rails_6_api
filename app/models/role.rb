class Role
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  include Mongoid::Paranoia

  belongs_to :user

  field :name, type: String
  field :entity, type: String
  field :entity_id, type: String

  ROOT = 'root'

  validates_presence_of :name

  def self.get_role(user_id, entity_id)
    return ROOT if self.find_by!(user_id: user_id).name == ROOT
  end
end
