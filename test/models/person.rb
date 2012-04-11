class Person
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps

  field :login,    type: String,  default: "me"
  field :password, type: String
  field :name,     type: String,  default: "me"
  field :age,      type: Integer
  field :email,    type: String

  validates_presence_of(:name)
  validates_uniqueness_of(:email)
  validates_uniqueness_of(:login, case_sensitive: false)
  validates_length_of(:password, minimum: 8, maximum: 16)
  validates_format_of(:email, with: //)
end
