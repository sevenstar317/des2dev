module IdeasHelper

  def idea_devices_names(idea)
    devices = idea.devices.map do |device|
      if device.name == Device::OTHER
        note = idea.ideas_devices.find_by(device: device).note
        "#{device} (#{note})"
      else
        device.name
      end
    end
    devices.join(', ')
  end

  def deadline_days(date)
    (Date.today - date).to_i
  end
end
