lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wordnet_japan/version"

Gem::Specification.new do |spec|
  spec.name          = "wordnet_japan"
  spec.version       = WordnetJapan::VERSION
  spec.authors       = ["yamasy1549"]
  spec.email         = ["sanae@yamasy.info"]

  spec.summary       = %q{Ruby wrapper for 日本語WordNet}
  spec.description   = %q{http://compling.hss.ntu.edu.sg/wnja/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.metadata["source_code_uri"] = "https://github.com/yamasy1549/wordnet_japan_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/yamasy1549/wordnet_japan_ruby/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
