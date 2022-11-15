require 'rails_helper'
RSpec.describe MediaSenderJob, type: :job do
  it 'enqueues an image call' do
    MediaSenderJob.perform_async 'france', true
    expect(MediaSenderJob).to have_enqueued_sidekiq_job('france', true)
  end
end
