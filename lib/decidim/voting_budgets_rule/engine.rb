# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module VotingBudgetsRule
    # This is the engine that runs on the public interface of voting_budgets_rule.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::VotingBudgetsRule

      routes do
        # Add engine routes here
        # resources :voting_budgets_rule
        # root to: "voting_budgets_rule#index"
      end

      initializer "decidim_voting_budgets_rule.assets" do |app|
        app.config.assets.precompile += %w[decidim_voting_budgets_rule_manifest.js decidim_voting_budgets_rule_manifest.css]
      end
    end
  end
end
