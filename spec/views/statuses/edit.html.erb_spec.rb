require 'rails_helper'

RSpec.describe "statuses/edit", type: :view do
  let(:status) {
    Status.create!(
      name: "review"
    )
  }

  before(:each) do
    assign(:status, status)
  end

  it "renders the edit status form" do
    render

    assert_select "form[action=?][method=?]", status_path(status), "post" do

      assert_select "input[name=?]", "status[name]"
    end
  end
end
