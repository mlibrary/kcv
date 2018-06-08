# frozen_string_literal: true

require 'checkpoint/agent'
require 'ostruct'

module KCV
  # Base AgentResolver to integrate Keycard and Checkpoint.
  #
  # This resolver depends on the actor having the `#identity` method, from
  # which all attributes are extracted and delivered as agents, as converted
  # by the `agent_factory`.
  class AgentResolver < Checkpoint::Agent::Resolver
    def initialize(agent_factory: Checkpoint::Agent)
      @agent_factory = agent_factory
    end

    def resolve(actor)
      super + actor.identity.all.map { |k, v| agents_for(k, v) }.flatten
    end

    def agents_for(attribute, values)
      [values].flatten.map do |value|
        agent_factory.from(OpenStruct.new(agent_type: attribute, agent_id: value))
      end
    end

    private

    attr_reader :agent_factory
  end
end
