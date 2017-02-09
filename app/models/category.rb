class Category < ApplicationRecord
  has_and_belongs_to_many :ideas
  has_and_belongs_to_many :projects

  DEFAULTS = [
    {icon: 'books',            name: 'Books'},
    {icon: 'business',         name: 'Business'},
    {icon: 'catalog',          name: 'Catalog'},
    {icon: 'education',        name: 'Education'},
    {icon: 'entertainment',    name: 'Entertainment'},
    {icon: 'finance',          name: 'Finance'},
    {icon: 'foodanddrink',     name: 'Food & Drink'},
    {icon: 'games',            name: 'Games'},
    {icon: 'healthandfitness', name: 'Health & Fitness'},
    {icon: 'kids',             name: 'Kids'},
    {icon: 'lifestyle',        name: 'Life Style'},
    {icon: 'medical',          name: 'Medical'},
    {icon: 'music',            name: 'Music'},
    {icon: 'navigation',       name: 'Navigation'},
    {icon: 'news',             name: 'News'},
    {icon: 'photoandvideo',    name: 'Photo & Video'},
    {icon: 'productivity',     name: 'Productivity'},
    {icon: 'reference',        name: 'Reference'},
    {icon: 'shopping',         name: 'Social'},
    {icon: 'sports',           name: 'Sports'},
    {icon: 'travel',           name: 'Travel'},
    {icon: 'utilities',        name: 'Utilities'}
  ]


  scope :ordered, -> { order(name: :asc) }

  def self.generate_defaults
    DEFAULTS.each do |category|
      create(name: category[:name], icon: category[:icon])
    end
  end

  def to_s
    name
  end
end
