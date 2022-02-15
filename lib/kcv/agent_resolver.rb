# frozen_string_literal: true

require "checkpoint/agent"

module KCV
  # Base AgentResolver to integrate Keycard and Checkpoint.
  #
  # This resolver depends on the actor having the `#identity` method, from
  # which all attributes are extracted and delivered as agents, as converted
  # by the `agent_factory`.
  class AgentResolver < Checkpoint::Agent::Resolver
    IdentityAttribute = Struct.new(:agent_type, :agent_id)

    def expand(actor)
      [convert(actor)] + identity_agents(actor)
    end

    private

    def identity_agents(actor)
      actor.identity.flat_map do |attr, values|
        [values].flatten.map do |value|
          convert IdentityAttribute.new(attr, value)
        end
      end
    end
  end
end
