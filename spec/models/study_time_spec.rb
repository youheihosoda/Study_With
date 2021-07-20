require 'rails_helper'
describe StudyTime do
  describe '#update' do
    study_time = update(:study_time, study_method: "")
    study_time.valid?
    expect(study_time.errors[:study_method]).to
  end
end