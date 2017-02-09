class Project < ApplicationRecord

  belongs_to :owner, class_name: User
  has_and_belongs_to_many :categories
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images


  scope :published, -> { where(status: STATUS::PUBLISHED) }

  def to_s
    name
  end

  def image
    images.first
  end

end
