require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:description).is_at_least(5) }
    it { should belong_to(:creator) }

    describe 'date validations' do
      let(:user) { FactoryGirl.create(:user) }

      it 'should not allow dates past today' do
        event = FactoryGirl.create(:event, creator: user)
        event.date = Time.now - 4.days
        expect { event.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'should allow today' do
        event = FactoryGirl.create(:event, creator: user,
                                           date: Time.now)
        expect(event.save).to be_truthy
      end

      it 'should allow any day after today' do
        event = FactoryGirl.create(:event, creator: user,
                                           date: Time.now + 4.days)
        expect(event.save).to be_truthy
      end
    end
  end
end
