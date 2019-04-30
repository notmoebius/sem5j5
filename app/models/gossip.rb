class Gossip < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :tag_gossip, required: false
    has_many :tags, through: :tag_gossips
end
