require 'gobject-introspection'
require File.expand_path(File.dirname(__FILE__)+"/../lib/gidx.rb")

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
    
    self.search_path_generator = Dino::SearchPathGenerator.new(File.expand_path("/usr/lib/gi-dino/plugins"))
    @plugin_registry           = Dino::PluginsRegistry.new()
    
    init
    
    Dino::PluginsLoader.new(self).load_all
  end
  
  def signal_do_activate
    e=get_entity('cadenplays@pbr69.hopto.me',nil)
    
    e.signal_connect(:call_incoming) do 
      w = DinoUI::UiCallWindow.new
      w.present
      next w
    end
    
    e.signal_connect :message_recv do |e,m,c|
      puts "MESSAGE from: #{c.account.full_jid.to_s}\n\t#{m.body}"
    end
    
    hold
  end
  
  class Entity < GIDX::Entity
    type_register
    
    def signal_do_connected s
      s.signal_connect :stanza_send do |_,s|
        puts s.to_xml
      end
      
      send_stanza_string("<iq id='2fe31bbb' type='get' to='pbr69.hopto.me' xmlns='jabber:client'><query xmlns='http://jabber.org/protocol/disco#info'/></iq>") do |o|
        p o
      end
      
      s = stanza(:iq, attrs: {to: 'pbr69.hopto.me', type: :get, id: 'get1'}) << 
        stanza(:query, ns: ns='http://jabber.org/protocol/disco#info') 
      
      send_stanza s do |o| 
        o.get_subnode('query',ns,nil).get_subnodes('feature',nil,nil).map do |f| 
          p f[:var] 
        end
      end
      
      add_feature("urn:xmpp:microblog:0+notify")
      add_feature("urn:xmpp:microblog:0")
      p features
    end
    
    alias _stanza stanza
    def stanza n, ns: 'jabber:client', attrs: {}
      s = _stanza n, ns
      attrs.each do |a,v| s.put_attribute a,v.to_s end
      s
    end 
  end
  
  def virtual_do_get_entity j,p
    return GIDX::Loader.instantiate_gobject_pointer(GIDX::Entity.map[j]) if GIDX::Entity.map[j]
    GIDX::Entity.map[j] = Entity.new(app: self,account: db.accounts.find do |a| a.bare_jid.to_s==j end)
  end
end

App.new.run
