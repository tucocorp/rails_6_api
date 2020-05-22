class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  include Mongoid::Paranoia
  include ActiveModel::SecurePassword

  has_secure_password

  has_many :roles

  field :name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /@/
  validates_presence_of :password_digest

  # scope :entity_role_ids, -> { roles.pluck[:entity_id] }

  def add_role(name, entity = nil, entity_id = nil)
    roles.create!(name: name, entity: entity, entity_id: entity_id)
  end

  def has_role?(name)
    roles.where(name: name).present?
  end

  def root?
    has_role?(:root)
  end
end
