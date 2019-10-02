require "ffi"

require "stb_image_ffi/version"

module STBImage
  extend FFI::Library
  ffi_lib File.join(__dir__, "./stb_image.so")

  typedef :uchar, "stbi_uc"
  typedef :ushort, "stbi_us"

  attach_function :stbi_set_flip_vertically_on_load, [:int], :void
  attach_function :stbi_load, [:string, :pointer, :pointer, :pointer, :int], :pointer
end
