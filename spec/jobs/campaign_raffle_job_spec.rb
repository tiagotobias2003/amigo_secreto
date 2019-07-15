require "rails_helper"

RSpec.describe CampaignRaffleJob, type: :job do
  include ActiveJob::TestHelper

  before(:each) do
    @campaign = FactoryBot.create(:campaign)
  end

  subject(:job) { described_class.perform_later(@campaign) }

  it "queues the job" do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it "matches with enqueued job" do
    expect { described_class.perform_later }.to have_enqueued_job(described_class)
  end

  it "is in default queue" do
    expect(described_class.new.queue_name).to eq("emails")
  end

  #it "executes perform" do
  #  perform_enqueued_jobs { job }
  #  expect { @campaign }
  #    .to change { ActionMailer::Base.deliveries.count }.by(1)
  #end

end
