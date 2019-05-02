
class User < ApplicationRecord
    has_secure_password
    belongs_to :city, required: false
    has_many :gossips
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    
    validates :password_digest, presence: true, length: { minimum: 6 }
end
