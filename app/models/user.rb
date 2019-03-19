class User < ActiveRecord::Base
    # Association
    has_many :articles, dependent: :destroy

    # Callback
    before_save { self.email = email.downcase }

    # validates
    validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum:3, maximum:25 }

    VALID_EMAIL_REGEX= /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum:105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end