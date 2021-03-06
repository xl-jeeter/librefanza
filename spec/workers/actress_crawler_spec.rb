require "rails_helper"

RSpec.describe ActressCrawler, type: :worker do
  it "creates actresses" do
    10.times do |i|
      create :fanza_actress, fanza_id: i + 1
    end

    expect {
      subject.perform(10)
    }.to change {
      FanzaActress.count
    }.by(10)
  end

  it "updates existing actresses" do
    10.times do |i|
      create :fanza_actress, fanza_id: i + 1
    end
    expect {
      subject.perform(10)
    }.to change {
      FanzaActress.first.name
    }
  end

  it "starts at tail with overlap" do
    create_list :fanza_actress, 20
    expect(Fanza::Api).to receive(:actress_search).with(offset: 11).and_call_original
    subject.perform(10)
  end

  it "always starts with positive offset" do
    expect(Fanza::Api).to receive(:actress_search).with(offset: 1).and_call_original
    subject.perform(10)
  end
end
