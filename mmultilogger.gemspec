# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mmultilogger/version"

Gem::Specification.new do |spec|
  spec.name          = "mmultilogger"
  spec.version       = Mmultilogger::VERSION
  spec.authors       = ["Hugo Duksis"]
  spec.email         = ["duksis@gmail.com"]

  spec.summary       = %q{Logger proxy that allows to log to multiple loggers at the same time}
  spec.description   = %q{Mmultilogger enables you to log to to different places with different configuration as long as the loggers impplement the same interface.}
  spec.homepage      = "https://github.com/mindmatch/mmultilogger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
