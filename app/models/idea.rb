class Idea < ApplicationRecord
  belongs_to :owner, class_name: User
  has_many :prices, as: :priceable, dependent: :destroy
  accepts_nested_attributes_for :prices
  has_many :ideas_devices, dependent: :destroy
  accepts_nested_attributes_for :ideas_devices, allow_destroy: true
  has_many :devices, through: :ideas_devices
  has_and_belongs_to_many :categories
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  COMPLETE = 'complete'
  WIREFRAMES = 'wireframes'
  LOGO = 'logo'
  SCREENS = 'screens'
  CUSTOM = 'custom'

  after_create :create_related_models

  scope :published, -> { where(status: STATUS::PUBLISHED) }

  def self.search(category_id:)
    return all unless category_id.present?
    joins(:categories).where(categories: { id: category_id })
  end

  def to_s
    name
  end

  def price(price_type)
    prices.find_by(kind: price_type[:kind])
  end

  def calculate_discount
    case prices.active.count
      when 2 then 5
      when 3 then 10
      when 4 then 15
      when 5 then 20
      else 0
    end
  end

  def contest?
    self.designer_participation == 'contest'
  end

  def calculate_prices
    prices.each(&:recalculate)
    self.subtotal_price = prices.active.pluck(:total).sum
    self.discount = calculate_discount
    self.total_price = (1.0 - self.discount / 100.0) * self.subtotal_price
    self.grand_total = self.total_price
    self.grand_total = self.grand_total * 1.2 if contest?
    self.save!
  end

  private

    def create_related_models
      [Price::LOGO, Price::ICON, Price::SCREENS, Price::FLOW, Price::EXPERT].each do |price_type|
        quantity = price_type == Price::SCREENS ? 5 : 1
        prices.create(
          kind: price_type[:kind],
          name: price_type[:name],
          price: price_type[:price],
          active: true,
          quantity: quantity
        )
      end
    end
end
