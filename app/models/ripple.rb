class Ripple < ApplicationRecord
    validates :name, :message, presence: true
    before_destroy :disallow_change
    before_update :disallow_change
    
    def disallow_change
        false
    end
    
end
