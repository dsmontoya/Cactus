class Resume < ActiveRecord::Base
	belongs_to :user
	mount_uploader :file, ResumeUploader
end
