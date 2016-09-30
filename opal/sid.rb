require 'vendor/jssid'

class SID
  include Native

  alias_native :load_and_play, :loadstart
  alias_native :load, :loadinit

  alias_native :start
  alias_native :stop

  alias_native :pause
  alias_native :unpause, :playcont

  alias_native :title, :gettitle
  alias_native :author, :getauthor
  alias_native :info, :getinfo

  alias_native :tunes, :getsubtunes
  alias_native :prefered_model, :getprefmodel
  alias_native :play_time, :getplaytime

  alias_native :get_model, :getmodel
  alias_native :set_model, :setmodel

  alias_native :setloadcallback
  alias_native :setstartcallback
  alias_native :setendcallback
  alias_native :setmemorywritecallback

  def initialize(buffersize = 16384, background_noise = 0.0005)
    @native = `new jsSID(#{buffersize}, #{background_noise})`
  end

  def on_load(&block)
    setloadcallback(block)
  end

  def on_start(&block)
    setstartcallback(block)
  end

  def on_end(time, &block)
    setendcallback(block, time)
  end

  def on_memory_write(&block)
    setmemorywritecallback(block)
  end
end
