class User < ApplicationRecord
    has_secure_password
    
    validates :username,
            presence: true,
            length: { minimum: 3 },
            uniqueness: { case_sensitive: false }

    validates :password, length: { minimum: 8 }
    
    # Ensure email is unique
    validates :email, uniqueness: true
    
    has_many :links, dependent: :destroy
    has_many :comments

    def owns_link?(link)
        self == link.user
    end

    def owns_comment?(comment)
        self == comment.user
    end
end
