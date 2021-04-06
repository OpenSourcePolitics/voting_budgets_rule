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
        app.config.assets.precompile += %w(decidim_voting_budgets_rule_manifest.js decidim_voting_budgets_rule_manifest.css)
      end

      initializer "add_cells_view_paths" do
        # Insert cell in second position to allow overriding
        Cell::ViewModel.view_paths.insert(
          Cell::ViewModel.view_paths.index(Rails.root.join("app", "cells")) + 1,
          File.expand_path("#{root}/app/cells")
        )
      end

      initializer "extend_component" do
        require "decidim/extends/component_extend"
      end
    end
  end
end
