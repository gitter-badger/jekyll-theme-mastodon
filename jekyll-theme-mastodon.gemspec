# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-mastodon"
  spec.version       = "1.0.0"
  spec.authors       = ["EthanMcBloxxer"]
  spec.email         = ["ethanmcbloxxer@protonmail.com"]

  spec.summary       = "jekyll-theme-mastodon is a Jekyll theme built from Mastodon, the open-source social media platform."
  spec.homepage      = "https://github.com/EthanMcBloxxer/jekyll-theme-mastodon/"
  spec.license       = "AGPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|license|readme)!i) }

  spec.add_runtime_dependency "github-pages"
end
