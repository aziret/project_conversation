# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Status, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe 'associations' do
    it { should have_many(:project_histories) }
    it { should have_many(:projects).through(:project_histories) }
  end
end
