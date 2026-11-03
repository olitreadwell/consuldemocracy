require "rails_helper"

describe WelcomeHelper do
  describe "#is_active_class" do
    it "marks only the first slide as active" do
      expect(is_active_class(0)).to eq("is-active is-in")
    end

    it "returns nil for any other slide" do
      expect(is_active_class(1)).to be(nil)
    end
  end

  describe "#slide_display" do
    it "hides slides after the first one" do
      expect(slide_display(1)).to eq("display: none;")
    end

    it "shows the first slide" do
      expect(slide_display(0)).to be(nil)
    end
  end

  describe "#calculate_offset" do
    it "offsets when both debates and proposals are present and offset applies" do
      expect(calculate_offset([1], [1], true)).to eq("medium-offset-2 large-offset-2")
    end

    it "ends the row when both are present but offset does not apply" do
      expect(calculate_offset([1], [1], false)).to eq("end")
    end

    it "returns nil when only one of them is present" do
      expect(calculate_offset([1], [], true)).to be(nil)
    end
  end

  describe "#calculate_centered" do
    it "centers when only proposals are present" do
      expect(calculate_centered([], [1])).to eq("medium-centered large-centered")
    end

    it "centers when only debates are present" do
      expect(calculate_centered([1], [])).to eq("medium-centered large-centered")
    end

    it "returns nil when both are present" do
      expect(calculate_centered([1], [1])).to be(nil)
    end
  end

  describe "#calculate_carousel_size" do
    it "combines the offset and centered classes" do
      expect(calculate_carousel_size([1], [1], true)).to eq("medium-offset-2 large-offset-2 ")
    end
  end
end
