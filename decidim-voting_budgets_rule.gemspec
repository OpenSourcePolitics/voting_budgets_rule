# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/voting_budgets_rule/version"

Gem::Specification.new do |s|
  s.version = Decidim::VotingBudgetsRule.version
  s.authors = ["Armand Fardeau"]
  s.email = ["fardeauarmand@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-voting_budgets_rule"
  s.required_ruby_version = ">= 2.5"

  s.name = "decidim-voting_budgets_rule"
  s.summary = "A decidim voting_budgets_rule module"
  s.description = "Voting budgets rule."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::VotingBudgetsRule.version
end
