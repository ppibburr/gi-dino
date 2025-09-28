require File.expand_path(File.join(File.dirname(__FILE__), "..", "xmpp/lib/xmpp"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "dino/lib/dino"))

require 'gio2'

DINO_SOURCE = File.expand_path(ENV['DINO_SOURCE_DIR'] ||= './git/dino/')
DINO_BUILD  = File.expand_path(ENV['DINO_BUILD_DIR']  ||= "#{ENV['DINO_SOURCE_DIR']}/build")

ENV['SEARCH_PATH'] ||= DINO_BUILD+"/plugins"

class App < Gio::Application
  type_register
  include Dino::Application 
  
  attr_accessor :db, :search_path_generator, :settings, :stream_interactor
  attr_writer   :plugin_registry
    
  def plugin_registry
    @plugin_registry ||= Dino::PluginsRegistry.new()
  end  

  install_property(GLib::Param::TypeInstance.new(
    "db", "db", "db",
    Dino::Database.gtype,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::TypeInstance.new(
    "search-path-generator","Search Path Generator","sp sp",
    Dino::SearchPathGenerator,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::Object.new(
    "settings","Settings","s s",
    Dino::EntitiesSettings,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::TypeInstance.new(
    "plugin-registry","Plugin_registry","p p",
    Dino::PluginsRegistry,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::TypeInstance.new(
    "stream-interactor","Stream IOnteracxtore","si p",
    Dino::StreamInteractor,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))    
  
  def initialize(app_id="im.dino.GIDino")
    super application_id: app_id, flags: :handles_open
    
    @search_path = ENV['SEARCH_PATH'] ||= DINO_BUILD
    self.search_path_generator = Dino::SearchPathGenerator.new(@search_path);
    
    Dino::Loader.reference_gobject plugin_registry
    
    init();
    
    signal_connect :activate do
      stream_interactor.interaction_modules
      quit
    end
    
    loader = Dino::PluginsLoader.new(self);
    loader.load_all();
  end
end

App.new.run
