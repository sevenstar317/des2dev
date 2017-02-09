module ApplicationHelper
  def detect_active_tab(*pathes)
    Array(pathes).each do |path|
      return 'active' if current_page?(path)
    end
   ''
  end
end
