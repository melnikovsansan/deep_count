# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deep_count/version'

Gem::Specification.new do |spec|
  spec.name          = "deep_count"
  spec.version       = DeepCount::VERSION
  spec.authors       = ["Alexandr Melnikov"]
  spec.email         = ["amelnikov@ergoserv.com"]

  spec.summary       = %q{Convert result of count by multiple group to nested hash.}
  spec.homepage      = "https://github.com/melnikovsansan/deep_count"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
