class Device < ApplicationRecord
  has_many :devices_ideas, dependent: :destroy
  has_many :ideas, through: :devices_ideas

  IOS = 'iOS'
  OSX = 'Mac OSX'
  ANDROID = 'Android'
  WINDOWS = 'Windows'
  OTHER = 'Other'

  DEFAULTS = [IOS, OSX, ANDROID, WINDOWS, OTHER]

  def self.generate_defaults
    DEFAULTS.each do |name|
      create(name: name)
    end
  end

  def to_s
    name
  end
end
