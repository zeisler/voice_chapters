# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voice_chapters/version'

Gem::Specification.new do |spec|
  spec.name          = "voice_chapters"
  spec.version       = '0.0.4'
  spec.authors       = ["Dustin Zeisler"]
  spec.email         = ["dustin@zive.me"]
  spec.description   = %q{Using the Mac system text-to-speech Voice Chapters will create an audio file
                          with bookmarked chapters. It takes a regex capture
                          group to define the chapter markers and the gem will create a m4a/acc file.}
  spec.summary       = %q{Using the Mac system text-to-speech Voice Chapters will create an audio file
                          with bookmarked chapters. It takes a regex capture
                          group to define the chapter markers and the gem will create a m4a/acc file.}
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
