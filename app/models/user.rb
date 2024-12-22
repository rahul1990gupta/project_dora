class User < ApplicationRecord
    has_secure_password
    validates :admin, inclusion: { in: [ true, false ] }

    validates :username,
            presence: true,
            length: { minimum: 3 },
            uniqueness: { case_sensitive: false }

    validates :password, length: { minimum: 8 }

    # Ensure email is unique
    validates :email, uniqueness: true

    has_many :links, dependent: :destroy
    has_many :comments
    has_many :goals

    def owns_link?(link)
        self.admin? || self == link.user
    end

    def owns_comment?(comment)
        self.admin? || self == comment.user
    end
    def admin?
        self.admin
    end
    def display
        self.admin? ? self.username + " [Admin]" : self.username
    end
end
