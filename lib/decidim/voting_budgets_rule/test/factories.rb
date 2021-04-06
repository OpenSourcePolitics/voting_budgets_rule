# frozen_string_literal: true

require "decidim/core/test/factories"
require "decidim/participatory_processes/test/factories"
require "decidim/proposals/test/factories"
require "decidim/comments/test/factories"

require "decidim/budgets/test/factories"

FactoryBot.modify do
  factory :budget_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :budgets).i18n_name }
    manifest_name { :budgets }
    participatory_space { create(:participatory_process, :with_steps, organization: organization) }
    trait :with_vote_threshold_percent do
      transient do
        vote_rule_threshold_percent_enabled { true }
        vote_rule_minimum_budget_projects_enabled { false }
        vote_rule_projects_enabled { false }
        vote_threshold_percent { 70 }
      end

      settings do
        {
          vote_rule_threshold_percent_enabled: vote_rule_threshold_percent_enabled,
          vote_rule_minimum_budget_projects_enabled: vote_rule_minimum_budget_projects_enabled,
          vote_rule_selected_projects_enabled: vote_rule_projects_enabled,
          vote_threshold_percent: vote_threshold_percent
        }
      end
    end
    trait :with_minimum_budget_projects do
      transient do
        vote_rule_threshold_percent_enabled { false }
        vote_rule_minimum_budget_projects_enabled { true }
        vote_rule_projects_enabled { false }
        vote_minimum_budget_projects_number { 3 }
      end

      settings do
        {
          vote_rule_threshold_percent_enabled: vote_rule_threshold_percent_enabled,
          vote_rule_minimum_budget_projects_enabled: vote_rule_minimum_budget_projects_enabled,
          vote_rule_selected_projects_enabled: vote_rule_projects_enabled,
          vote_minimum_budget_projects_number: vote_minimum_budget_projects_number
        }
      end
    end

    trait :with_budget_projects_range do
      transient do
        vote_rule_threshold_percent_enabled { false }
        vote_rule_minimum_budget_projects_enabled { false }
        vote_rule_projects_enabled { true }
        vote_minimum_budget_projects_number { 3 }
        vote_maximum_budget_projects_number { 6 }
      end

      settings do
        {
          vote_rule_threshold_percent_enabled: vote_rule_threshold_percent_enabled,
          vote_rule_minimum_budget_projects_enabled: vote_rule_minimum_budget_projects_enabled,
          vote_rule_selected_projects_enabled: vote_rule_projects_enabled,
          vote_selected_projects_minimum: vote_minimum_budget_projects_number,
          vote_selected_projects_maximum: vote_maximum_budget_projects_number
        }
      end
    end

    trait :with_votes_disabled do
      step_settings do
        {
          participatory_space.active_step.id => {
            votes: :disabled
          }
        }
      end
    end
    trait :with_show_votes_enabled do
      step_settings do
        {
          participatory_space.active_step.id => {
            show_votes: true
          }
        }
      end
    end
    trait :with_voting_finished do
      step_settings do
        {
          participatory_space.active_step.id => {
            votes: :finished,
            show_votes: true
          }
        }
      end
    end
  end
end
