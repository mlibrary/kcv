# frozen_string_literal: true

require "kcv/agent_resolver"
require "checkpoint/agent"
require "ostruct"

RSpec.describe KCV::AgentResolver do
  def agent_from(type:, id:)
    Checkpoint::Agent.new(OpenStruct.new(agent_type: type, agent_id: id))
  end

  let(:resolver)   { described_class.new }
  let(:actor)      { double('user', to_agent: user_agent, identity: attrs) }
  let(:user_agent) { agent_from(type: 'user', id: 'uid') }

  context "with one identity attribute" do
    let(:attrs)      { { "attr" => "val" } }
    let(:attr_agent) { agent_from(type: 'attr', id: 'val') }

    describe "expansion" do
      subject(:agents) { resolver.expand(actor) }

      it "gives agents for the user and attribute" do
        expect(agents).to contain_exactly(user_agent, attr_agent)
      end
    end
  end

  context "with two identity attributes" do
    let(:attrs)       { { "attr" => "val", "foo" => "bar" } }
    let(:attr_agent1) { agent_from(type: 'attr', id: 'val') }
    let(:attr_agent2) { agent_from(type: 'foo',  id: 'bar') }

    describe "expansion" do
      subject(:agents) { resolver.expand(actor) }

      it "gives agents for the user and both attributes" do
        expect(agents).to contain_exactly(user_agent, attr_agent1, attr_agent2)
      end
    end
  end

  context "with a multi-valued attribute" do
    let(:attrs)       { { "attr" => %w[val other] } }
    let(:attr_agent1) { agent_from(type: 'attr', id: 'val') }
    let(:attr_agent2) { agent_from(type: 'attr', id: 'other') }

    describe "expansion" do
      subject(:agents) { resolver.expand(actor) }

      it "gives agents for the user and both attributes" do
        expect(agents).to contain_exactly(user_agent, attr_agent1, attr_agent2)
      end
    end
  end
end
