# gi-dino
`GObjectIntropsection` capable version of `dino-im` - single file build system

===Example (xmpp)
```ruby
require File.expand_path(File.join(File.dirname(__FILE__), "..", "xmpp/lib/xmpp"))

@loop       = GLib::MainLoop.new
stanza_node = Xmpp::StanzaNode.new("ree", "jabber:client")

stanza_node.add_self_xmlns()

stanza_node["bar"] = "42"

fail "put/get" unless stanza_node["bar"] == "42"

r = Xmpp::StanzaReader.new(str = "<message xmlns='jabber:client' type='chat' to='foo@bar.org'><body>ree</body></message>");

r.read_stanza_node do |sr,t,c|

  result = r.read_stanza_node_finish(t).to_xml();

  fail "read stanza string" unless result == str
  
  @loop.quit
end

@loop.run

```

===Example (dino)
```ruby
#
# Answer an incoming call (audio/video)!
#

require File.expand_path(File.join(File.dirname(__FILE__), "..", "xmpp/lib/xmpp"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "dino/lib/dino"))

require 'gio2'

DINO_SOURCE = File.expand_path(ENV['DINO_SOURCE_DIR'] ||= './git/dino/')
DINO_BUILD  = File.expand_path(ENV['DINO_BUILD_DIR']  ||= "#{ENV['DINO_SOURCE_DIR']}/build")

ENV['SEARCH_PATH'] ||= DINO_BUILD

class App < Gio::Application
  type_register
  include Dino::Application 
  
  attr_accessor :db, :search_path_generator, :settings, :stream_interactor
  attr_writer   :plugin_registry
    
  def plugin_registry
    @plugin_registry ||= Dino::PluginsRegistry.new()
  end  

  install_property(GLib::Param::Object.new(
    "db", "db", "db",
    Dino::Database.gtype,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::Object.new(
    "search-path-generator","Search Path Generator","sp sp",
    Dino::SearchPathGenerator,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::Object.new(
    "settings","Settings","s s",
    Dino::EntitiesSettings,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::Object.new(
    "plugin-registry","Plugin_registry","p p",
    Dino::PluginsRegistry,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))
  
  install_property(GLib::Param::Object.new(
    "stream-interactor","Stream IOnteracxtore","si p",
    Dino::StreamInteractor,
    224 | GLib::Param::READABLE | GLib::Param::WRITABLE
  ))    
  
  def initialize(app_id="im.dino.GIDino")
    super application_id: app_id, flags: :handles_open
    
    @search_path = ENV['SEARCH_PATH'] ||= DINO_BUILD
    self.search_path_generator = Dino::SearchPathGenerator.new(@search_path);
    
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

```

Vala

```
valac sample/dino.vala \
    --pkg gio-2.0 --pkg DinoUI-0.1 --pkg Dino-0.1 --pkg Xmpp-0.1 --pkg gee-0.8 \
    --pkg Qlite-0.1 --pkg gtk4 -X -I/usr/include/gi-dino -X -ldino \
    -o sample/bin/dino -X -fPIC
```
