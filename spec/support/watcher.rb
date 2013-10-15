class Watcher < EM::SwinsianWatch
  attr_accessor :user_info

  def on_play(user_info)
    @user_info = user_info
  end
end

