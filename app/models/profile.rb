class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :picture
  do_not_validate_attachment_file_type :picture

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
end
