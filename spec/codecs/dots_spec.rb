# encoding: utf-8

require_relative "../spec_helper"
require "logstash/plugin"
require "logstash/event"

describe LogStash::Codecs::Dots do

  it "should initialize without errors" do
    klass = LogStash::Plugin.lookup("codec", "dots")
    expect { klass.new }.to_not raise_error
  end

  describe "event encoding" do

    let(:properties) { {:name => "foo" } }
    let(:event)      { LogStash::Event.new(properties) }

    it "should encode as a dot" do
      subject.on_event do |event, data|
        expect(data).to eq(".")
      end
      subject.encode(event)
    end

  end

  describe "event decoding" do

    it "should raise an exception" do
      expect { subject.decode }.to raise_error
    end

  end

end
