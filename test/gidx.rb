require 'gobject-introspection'

module GIDX
  class Loader < GObjectIntrospection::Loader
  end

  Loader.load("GIDX", self)
end

require './xmpp/lib/xmpp.rb'
require './dino/lib/dino.rb'

require 'gtk4'

class App < Gtk::Application
  type_register
  include Dino::Application
  include GIDX::UiApplication
  
  attr_accessor :db
  install_property GLib::Param::TypeInstance.new(
    'db',nil,nil,
    Dino::Database,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  )
  
  attr_accessor :settings
  install_property GLib::Param::TypeInstance.new(
    'settings',nil,nil,
    Dino::EntitiesSettings,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  )
  
  attr_accessor :stream_interactor
  install_property GLib::Param::TypeInstance.new(
    'stream-interactor',nil,nil,
    Dino::StreamInteractor,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  )    
  
  attr_accessor :search_path_generator
  install_property GLib::Param::TypeInstance.new(
    'search-path-generator',nil,nil,
    Dino::SearchPathGenerator,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  )
  
  attr_accessor :plugin_registry
  install_property GLib::Param::TypeInstance.new(
    'plugin-registry',nil,nil,
    Dino::PluginsRegistry,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  )  
  
  def initialize *o
    super application_id: "org.foo.Bar", flags: Gio::ApplicationFlags::HANDLES_OPEN
    
    self.search_path_generator = Dino::SearchPathGenerator.new(File.expand_path("./git/dino/build/plugins"))
    @plugin_registry           = Dino::PluginsRegistry.new()
    
    init
    
    Dino::PluginsLoader.new(self).load_all
  end
  
  def signal_do_activate
    quit
  end
  

end

App.new.run
