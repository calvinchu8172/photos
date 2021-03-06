class Photo < ActiveRecord::Base
	validates_presence_of :name

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	belongs_to :user
	has_many :comments, :dependent => :destroy

	def can_delete_by?(user)
     (self.user == user ) || user.admin?
    end
end
