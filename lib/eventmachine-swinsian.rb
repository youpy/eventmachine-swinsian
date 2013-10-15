require 'eventmachine-swinsian/version'
require 'eventmachine-distributed-notification'

module EventMachine
  class SwinsianWatch < DistributedNotificationWatch
    ACTION_PLAYING = 'com.swinsian.Swinsian-Track-Playing'
    ACTION_PAUSED = 'com.swinsian.Swinsian-Track-Paused'
    ACTION_STOPPED = 'com.swinsian.Swinsian-Track-Stopped'

    def notify(name, user_info)
      case name
      when ACTION_PLAYING
        on_play(user_info)
      when ACTION_PAUSED
        on_pause(user_info)
      when ACTION_STOPPED
        on_stop(user_info)
      end
    end

    def on_play(user_info); end
    def on_pause(user_info); end
    def on_stop(user_info); end
  end

  def self.watch_swinsian(handler = nil, *args, &block)
    args = [
      [
        SwinsianWatch::ACTION_PLAYING,
        SwinsianWatch::ACTION_PAUSED,
        SwinsianWatch::ACTION_STOPPED
      ],
      *args
    ]
    klass = klass_from_handler(EventMachine::SwinsianWatch, handler, *args);
    c = klass.new(*args, &block)
    c.start
    yield c if block_given?
    c
  end
end
