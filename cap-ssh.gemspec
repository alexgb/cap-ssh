# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cap-ssh/version'

Gem::Specification.new do |gem|
  gem.name          = "cap-ssh"
  gem.version       = Cap::SSH::VERSION
  gem.authors       = ["Alex Gibbons"]
  gem.email         = ["alex.gibbons@gmail.com"]
  gem.description   = %q{Initiate an SSH session from your Capistrano configured servers.}
  gem.summary       = %q{Capistrano recipe to connect to servers over SSH}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
