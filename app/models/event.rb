class Event < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :creator, class_name: "User"
  has_many :votes
  has_many :users, through: :votes
end  