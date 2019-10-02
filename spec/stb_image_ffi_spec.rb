RSpec.describe STBImage do
  it "has a version number" do
    expect(STBImage::VERSION).not_to be nil
  end

  describe "::stbi_load" do
    it "gets the image data" do
      file = File.join(__dir__, "./fixtures/test.jpg")
      width_ptr = " " * 8
      height_ptr = " " * 8
      channels_ptr = " " * 8
      desired_channels = 3
      ptr = STBImage.stbi_load(file, width_ptr, height_ptr, channels_ptr, desired_channels)
      width = width_ptr.unpack1 "L"
      height = height_ptr.unpack1 "L"
      channels = channels_ptr.unpack1 "L"
      data = ptr.get_bytes(0, width * height * channels)
      expect(data.unpack("C6")).to eq [254, 0, 0, 254, 0, 0]
    end
  end

  describe "::stbi_set_flip_vertically_on_load" do
    it "returns the image data flipped vertically" do
      STBImage.stbi_set_flip_vertically_on_load 1
      file = File.join(__dir__, "./fixtures/test.jpg")
      width_ptr = " " * 8
      height_ptr = " " * 8
      channels_ptr = " " * 8
      desired_channels = 3
      ptr = STBImage.stbi_load(file, width_ptr, height_ptr, channels_ptr, desired_channels)
      width = width_ptr.unpack1 "L"
      height = height_ptr.unpack1 "L"
      channels = channels_ptr.unpack1 "L"
      data = ptr.get_bytes(0, width * height * channels)
      expect(data.unpack("C6")).to eq [0, 0, 254, 0, 0, 254]
    end
  end
end
