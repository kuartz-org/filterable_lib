require "filterable/version"

Gem::Specification.new do |spec|
  spec.name          = "filterable"
  spec.version       = Filterable::VERSION
  spec.authors       = ["Kuartz"]
  spec.email         = ["contact@kuartz.fr"]

  spec.summary       = %q{Easy filtering of Active Record objects}
  spec.description   = %q{Filterable gem aims to simplify the process of filtering active record objects, using ViewComponent.}
  spec.homepage      = "https://github.com/toschas/filterable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
  spec.add_dependency "activerecord"
  spec.add_dependency "activesupport"
end
