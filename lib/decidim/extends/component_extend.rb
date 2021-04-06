# frozen_string_literal: true

budget_manifest = Decidim.find_component_manifest(:budgets)

settings = budget_manifest.settings(:global)

settings.attribute :vote_rule_selected_projects_enabled, type: :boolean, default: false
settings.attribute :vote_selected_projects_minimum, type: :integer, default: 0
settings.attribute :vote_selected_projects_maximum, type: :integer, default: 1
