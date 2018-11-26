class AdminUser    < ApplicationRecord

	
	has_secure_password

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits


	FORBIDDEN_USERNAMES = ["abc123abc", "123abc123"]

	#EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	#validates_presence_of :first_name
	#validates_length_of :first_name, :maximum => 20
	#validates_presence_of :last_name
	#validates_length_of :last_name, :maximum => 20
	#validates_presence_of :email
	#validates_uniqueness_of :email
	#validates_length_of :email, :within => 5..100
	#validates_format_of :email , :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	#validates_confirmation_of :email
	#validates_presence_of :username
	#validates_length_of :username, :within => 8..50
	#validates_uniqueness_of :username

	# shortcuts validation for aka "sexy validations"
	validates :first_name, :presence => true, :length => {:maximum => 25}
	
	validates :last_name, :presence => true, :length => {:maximum => 25}

	validates :email, :presence => true, :length => {:within => 8..50}, :uniqueness => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}, :confirmation => true

	validates :username, :presence => true, :length => {:within => 8..50}, :uniqueness => true

	validate :username_is_allowed


	scope :sorted, lambda { order('last_name ASC, first_name ASC') }

	def name

		"#{first_name} #{last_name}"

	end
	def username_is_allowed
		if FORBIDDEN_USERNAMES.include?(username)
			errors.add(:username, "This user is not allowed to login")
		end
	end

end
