require 'rails_helper'

RSpec.describe ProjectHistory, type: :model do
  describe 'associations' do
    it { should belong_to(:actionable) }
  end
  it { should belong_to(:project) }
end
