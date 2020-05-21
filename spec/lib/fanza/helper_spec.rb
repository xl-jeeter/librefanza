require "rails_helper"

RSpec.describe "Fanza::Helper" do
  describe "#normalize_id" do
    it "works" do
      {
        "abp123" => "ABP-123",
        "abp00123" => "ABP-123",
        "abp00123dod" => "ABP-123",
        "abp00001" => "ABP-001",
        "104bshd16" => "BSHD-16",
        "h_244sama083dod" => "SAMA-083",
        "118ezd300_ar" => "EZD-300",
        "1230crs010a_t" => "CRS-010",
        "55csct005tk2" => "CSCT-005",
        "ABP-123" => "ABP-123",
        "2APAA-101" => "APAA-101",
        "td008dv1569d" => "DV-1569",
      }.each do |original, normalized|
        expect(Fanza::Helper.normalize_id(original)).to eq(normalized)
      end
    end
  end
end