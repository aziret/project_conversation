# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe 'associations' do
    it { should have_many(:project_histories) }
    it { should have_many(:comments).through(:project_histories) }
    it { should have_many(:statuses).through(:project_histories) }
  end
end
