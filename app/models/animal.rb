class Animal < ApplicationRecord
    validates :aname, presence: true
    # validates :aname, uniqueness: { case_sensitive: false }
end
