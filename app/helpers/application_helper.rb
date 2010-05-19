# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def hbr(target)
    target = html_escape(target)
    target.gsub(/\r\n|\r|\n/, "<br />")
  end
end
