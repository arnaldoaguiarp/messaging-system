class User < ApplicationRecord
  belongs_to :role

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id", dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
