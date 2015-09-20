module ApplicationHelper
  def active? boolean, text = 'active'
    boolean ? text : nil
  end
end
