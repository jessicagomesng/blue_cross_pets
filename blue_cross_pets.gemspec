
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blue_cross_pets/version"

Gem::Specification.new do |spec|
  spec.name          = "blue_cross_pets"
  spec.version       = BlueCrossPets::VERSION
  spec.summary       = %q{CLI that display Blue Cross UK adoptable dogs/cats}
  spec.description   = %q{Displays all the available dogs/cats listed on the Blue Cross UK website. This is my first gem, so please feel free to add suggestions.}
  spec.authors       = ["'Jessica Gomes-Ng'"]
  spec.email         = ["'jgnpeluso@gmail.com'"]
  spec.files         = ["bin/blue_cross_pets", "lib/blue_cross_pets.rb", "lib/blue_cross_pets/version.rb", "lib/blue_cross_pets/cli.rb", "lib/blue_cross_pets/scraper.rb", "lib/blue_cross_pets/dog.rb", "lib/blue_cross_pets/cat.rb", "lib/blue_cross_pets/pet.rb"]
#  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #  `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
#  end
  spec.homepage      = "https://github.com/jessicagomesng/blue_cross_pets"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
    #if spec.respond_to?(:metadata)
    #  spec.metadata["allowed_push_host"] = "https://rubygems.org"

    #  spec.metadata["homepage_uri"] = spec.homepage
    #  spec.metadata["source_code_uri"] = "https://github.com/jessicagomesng/blue_cross_pets"
    #  spec.metadata["changelog_uri"] = "https://github.com/jessicagomesng/blue_cross_pets"
    #else
    #  raise "RubyGems 2.0 or newer is required to protect against " \
    #    "public gem pushes."
    #end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.bindir        = "bin"
  spec.executables   = ["blue_cross_pets"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  spec.add_development_dependency "pry", '~> 0.13.1'
  spec.add_development_dependency "rspec", '~> 3.9.0'
  spec.add_dependency "nokogiri", '~> 1.10.9'
  spec.add_dependency "colorize", '~> 0.8.1'
end
