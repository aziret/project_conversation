# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:content) }

  describe 'associations' do
    it { should have_one(:project_history) }
    it { should have_one(:project).through(:project_history) }
  end
end
