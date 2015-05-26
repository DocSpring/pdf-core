require_relative "spec_helper"

describe "PDF Document State" do
  before { @state = PDF::Core::DocumentState.new({}) }

  describe "initialization" do
    it { expect(@state.compress).to eq(false) }
    it { expect(@state.encrypt).to eq(false) }
    it { expect(@state.skip_encoding).to eq(false) }
  end

  describe "normalize_metadata" do
    it { expect(@state.store.info.data[:Creator]).to eq("Prawn") }
    it { expect(@state.store.info.data[:Producer]).to eq("Prawn") }
  end

  describe "default trailer" do
    it "should contain an ID entry with two values in trailer" do
      expect(@state.trailer[:ID].count).to eq(2)
    end
  end

end
