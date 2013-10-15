class Controller
  def launch
    execute('launch')
  end

  def play
    execute('play')
  end

  def pause
    execute('pause')
  end

  private

  def execute(script_fragment)
    IO.popen('osascript -', 'w') do |f|
      f.write(<<SCRIPT)
tell application "Swinsian"
  #{script_fragment}
end tell
SCRIPT
    end
  end
end
