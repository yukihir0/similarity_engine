# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'similarity_engine/version'

Gem::Specification.new do |gem|
  gem.name          = "similarity_engine"
  gem.version       = SimilarityEngine::VERSION
  gem.authors       = ["yukihir0"]
  gem.email         = ["yukihiro.cotori@gmail.com"]
  gem.description   = %q{'similarity_engine' provides feature for calculating similarity of vector such as Cosine-similarity.}
  gem.summary       = %q{'similarity_engine' provides feature for calculating similarity of vector such as Cosine-similarity.}
  gem.homepage      = "https://github.com/yukihir0/similarity_engine"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
