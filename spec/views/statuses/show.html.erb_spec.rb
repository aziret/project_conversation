require 'rails_helper'

RSpec.describe "statuses/show", type: :view do
  before(:each) do
    assign(:status, Status.create!(
      name: "open"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
