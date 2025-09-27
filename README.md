# gi-dino
`GObjectIntropsection` capable version of [https://github.com/dino/dino](dino/dino)

# BUILD
rake help
rake clone-dino
rake build
rake test
rake install

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

require 'gtk4'

class Example < Gtk::Application
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
    
    @search_path = ENV['SEARCH_PATH'] || "./git/dino/build/plugins"
    self.search_path_generator = Dino::SearchPathGenerator.new(@search_path);

    init();
    
    signal_connect :activate do 
      user = ARGV[1]
      
      acct = db.accounts.find do |a|
        a.bare_jid.to_s == user
      end
      
      acct ||= Dino::EntitiesAccount.new(Xmpp::Jid.new(user), ARGV[3]);
	  
      # Enable the account
      acct.enabled = true;
      # Persist the account
      acct.persist(db);
      
      # Send a message once user account connects
      stream_interactor.signal_connect :stream_negotiated do |si, a,s|
        next unless a.bare_jid.to_s == user
      
        # send message to +jid+
        jid = 'admin@pbr69.hopto.me'
        msg = <<~EOM
          lol NVM bud.
        EOM
        
        c = db.get_conversations(a).find do |c_|
          c_.counterpart.bare_jid.to_s == jid
        end
    
        c ||= Dino::EntitiesConversation.new(Xmpp::Jid.new(jid), account, ct); 
      
        c.encryption = Dino::EntitiesEncryption::OMEMO

        Dino.send_message(c, msg, 0, nil, Xmpp.xep_message_markup_get_spans(Xmpp::MessageStanza.new));
      end
      
      # Gonna answer the call when they call us after getting our message
      # Will pop up a call window
      calls = stream_interactor.interaction_modules.find do |m|
        m.gtype == (Dino::Calls.gtype)
      end
      
      calls.signal_connect :call_incoming do |_,call, state, conversation, video,multiparty|
        state.accept();

        call_window            = DinoUI::UiCallWindow.new();
        call_window.controller = DinoUI::UiCallWindowController.new(call_window, state, stream_interactor);
        
        call_window.present();
      end
      
      mp=stream_interactor.interaction_modules.find do |m|
        m.gtype == (Dino::MessageProcessor.gtype)
      end
      
      mp.signal_connect(:message_received) do |_,m,c|
        puts message: m.body, from: m.counterpart.to_s
      end
      
      hold()
    end
  
    loader = Dino::PluginsLoader.new(self);
    loader.load_all(); 
  end
end

Example.new.run


```

Vala

```
valac sample/dino.vala \
    --pkg gio-2.0 --pkg DinoUI-0.1 --pkg Dino-0.1 --pkg Xmpp-0.1 --pkg gee-0.8 \
    --pkg Qlite-0.1 --pkg gtk4 -X -I/usr/include/gi-dino -X -ldino \
    -o sample/bin/dino -X -fPIC
```
