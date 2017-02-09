module LovsHelper

  def lov_t(value, scope)
    I18n.translate(value.presence, scope: scope, default: '')
  end

  def category_select
    Category.ordered.map { |c| [c.name, c.id, { 'data-data' => "{\"icon\": \"#{c.icon}\"}" }] }
  end
end
