require 'rails_helper'
RSpec.describe CountryCallJob, type: :job do
  it 'enqueues a country call' do
    CountryCallJob.perform_in 7.days, true
    expect(CountryCallJob).to have_enqueued_sidekiq_job(true)
  end
end
