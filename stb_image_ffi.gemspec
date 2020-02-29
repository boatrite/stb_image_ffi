lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stb_image_ffi/version"

Gem::Specification.new do |spec|
  spec.name = "stb_image_ffi"
  spec.version = STBImage::VERSION
  spec.authors = ["Boatrite"]
  spec.email = ["boatrite@mobiledoorman.com"]

  spec.summary = "Bindings for stb_image, the single file image loading library"
  spec.description = <<~DESCRIPTION
    Very naive bindings for stb_image.h. Implements only stbi_set_flip_vertically_on_load and stb_load since these are the 2 functions I need to load an image as a texture in OpenGL.

    The reason I made this instead of using stb-image is because stb-image didn't implement stbi_set_flip_vertically_on_load, as far as I can tell, which is useful/necessary when wanting to load image data in a format immediately consumable by OpenGL (see Example in README).
  DESCRIPTION
  spec.homepage = "https://github.com/boatrite/stb_image_ffi"
  spec.license = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
