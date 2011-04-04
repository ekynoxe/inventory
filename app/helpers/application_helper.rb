# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_device_requests_link
    if @device_requests_length != 0
      '<b>device requests ('+@device_requests_length.to_s+")</b>"
    else
      'device requests'
    end
  end
end
