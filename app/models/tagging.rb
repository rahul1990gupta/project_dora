class Tagging < ApplicationRecord
    belongs_to :link
    belongs_to :tag
end
