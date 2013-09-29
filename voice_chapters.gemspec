# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voice_chapters/version'

Gem::Specification.new do |spec|
  spec.name          = "voice_chapters"
  spec.version       = '0.0.2'
  spec.authors       = ["Dustin Zeisler"]
  spec.email         = ["dustin@zive.me"]
  spec.description   = %q{Using Mac system text to speech
                          read some text and express chapter markers
                          and gem will create an m4a file with chapters}
  spec.summary       = %q{Using Mac system text to speech
                          read some text and express chapter markers
                          and gem will create an m4a file with chapters}
  spec.homepage      = "https://github.com/zeisler/voice_chapters"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "chapter"

end
