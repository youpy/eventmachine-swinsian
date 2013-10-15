require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'rubygems'
require 'spec_helper'
require 'watcher'
require 'controller'

describe EventMachine::SwinsianWatch do
  before do
    @swinsian = Controller.new
  end

  after do
    @swinsian.pause
  end

  it 'should watch playing with class' do
    watcher = nil

    EM.run {
      watcher = EM.watch_swinsian(Watcher)
      @swinsian.play

      EM::add_timer(3) {
        EM.stop
        watcher.stop
      }
    }

    watcher.user_info['length'].should be_kind_of(Float)
  end

  it 'should watch playing with block' do
    result = nil
    watcher = nil

    EM.run {
      watcher = EM.watch_swinsian {|c|
        (class << c; self; end).send(:define_method, :on_play) {|info|
          result = info
        }
      }

      @swinsian.play

      EM::add_timer(3) {
        EM.stop
        watcher.stop
      }
    }

    result.should_not be_nil
    result['length'].should be_kind_of(Float)
  end
end
