# frozen_string_literal: true

module Decidim
  module VotingBudgetsRule
    # This is the engine that runs on the public interface of `VotingBudgetsRule`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::VotingBudgetsRule::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :voting_budgets_rule do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "voting_budgets_rule#index"
      end

      def load_seed
        nil
      end
    end
  end
end
