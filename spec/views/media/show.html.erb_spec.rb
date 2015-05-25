require 'rails_helper'

RSpec.describe "media/show", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
