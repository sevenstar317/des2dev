class Price < ApplicationRecord
  belongs_to :priceable, polymorphic: true

  LOGO    = { kind: 'logo',    price: 299,  name: 'Logo - Splash Screen / App Logo' }
  ICON    = { kind: 'icon',    price: 99,   name: 'App Icon (iOS & Android)' }
  SCREENS = { kind: 'screens', price: 99.8, name: 'Screens' }
  FLOW    = { kind: 'flow',    price: 149,  name: 'App Flow' }
  EXPERT  = { kind: 'expert',  price: 99,   name: 'With help of our expert developer guide' }

  after_save :recalculate

  scope :active, -> { where(active: true) }

  def to_s
    name
  end

  def screens_price
    case
      when quantity < 5 then 119
      when quantity == 5 then 99.8
      when quantity > 5 && quantity < 10 then (499 + 89 * (quantity - 5)) / quantity
      when quantity >= 10 then (855 + 49 * (quantity - 9)) / quantity
    end
  end

  def screens_total
    case
      when quantity < 5 then (119 * quantity)
      when quantity == 5 then (99.8 * quantity)
      when quantity > 5 && quantity < 10 then (499 + 89 * (quantity - 5))
      when quantity >= 10 then (855 + 49 * (quantity - 9))
    end
  end


  def recalculate
    if kind == SCREENS[:kind]
      update_column(:price, screens_price)
      update_column(:total, screens_total)
    else
      update_column(:total, price * quantity)
    end
  end

end
