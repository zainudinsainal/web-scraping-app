module ApplicationHelper
  def date d 
    d.strftime '%d %B %Y'
  end

  def datetime d
    d.strftime '%d %B %Y %I:%M %p'
  end
end
