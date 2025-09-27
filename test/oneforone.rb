require File.expand_path(File.join(File.dirname(__FILE__), "..", "xmpp/lib/xmpp"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "dino/lib/dino"))

require 'gtk4'

class Example < Gio::Application
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
    
    @search_path = ENV['SEARCH_PATH'] || "../dino/build/"
    self.search_path_generator = Dino::SearchPathGenerator.new(@search_path);

    init();
    
    signal_connect :activate do 
      user = ARGV[1]
      
      acct = db.accounts.find do |a|
        a.bare_jid.to_s == user
      end
      
      acct ||= Dino::Account.new(Xmpp.Jid.new(user), ARGV[3]);
	  
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
          Hey, Call me.
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

module GIDX
  class Entity < GLib::Object
    type_register
    
    define_signal("connected",
                GLib::Signal::RUN_FIRST, # flags
                nil,                     # accumulator (XXX: not supported yet)
                nil#,                    # return type (void == nil)
                #...                     # parameter types
                )
    # define 
    def signal_do_connected()
      
    end
    
    define_signal("stanza_recv",
                GLib::Signal::RUN_FIRST, # flags
                nil,                     # accumulator (XXX: not supported yet)
                nil,                     # return type (void == nil)
                Xmpp::StanzaNode         # parameter types
                )
    # define 
    def signal_do_stanza_recv(s)
      p time: Time.now, sti: s.to_xml if ARGV.index('--PRINT_INCOMING')
    end
    
    define_signal("stanza_send",
                GLib::Signal::RUN_FIRST, # flags
                nil,                     # accumulator (XXX: not supported yet)
                nil,                     # return type (void == nil)
                Xmpp::StanzaNode         # parameter types
                )
    # define 
    def signal_do_stanza_send(s)
      p time: Time.now, sto: s.to_xml if ARGV.index('--PRINT_OUTGOING')
    end    
    
    def signal name, rt=nil, params: [], flags: [:run_first], &b
      flags_ = nil
      flags.each do |f| 
        if !flags
          flags_ = GLib::Signal.const_get(k.to_s.upcase.to_sym)
        else
          flags_ |= GLib::Signal.const_get(k.to_s.upcase.to_sym)
        end
      end
      
      rt_     = rt
      params_ = params
      
      define_signal name, flags_, rt_, *params_
      
      define_method "signal_do_#{name}" do |*o|
        b.call(*o)
      end if b
    end
    
    define_signal("call_incoming",
                GLib::Signal::RUN_FIRST, # flags
                nil,                     # accumulator (XXX: not supported yet)
                nil,                    # return type (void == nil)
                Dino::EntitiesCall,
                Dino::CallState,
                Dino::EntitiesConversation,
                GLib::Type::BOOLEAN,
                GLib::Type::BOOLEAN,
                )
    # define 
    def signal_do_call_incoming(call, state, conv, video, multi)
      
    end
    
    define_signal("message_recv",
                GLib::Signal::RUN_FIRST, # flags
                nil,                     # accumulator (XXX: not supported yet)
                nil,                     # return type (void == nil)
                String,                  # parameter types
                Dino::EntitiesMessage,
                Dino::EntitiesMessageType,
                Dino::EntitiesConversation
                )
    # define 
    def signal_do_message_recv(from,m,t,c)
      
    end        
    
    
    attr_reader   :account, :stream
    def initialize acct,app
      super()
      
      @app     = app
      @account = acct
      
      Entity.map[base_jid] = self
    end
    
    def stream= s
      @stream = s
      
      s.signal_connect :received_iq_stanza do |s,_,iq|
        signal_emit :stanza_recv, iq
      end
      
      s.signal_connect :received_presence_stanza do |s,_,ps|
        signal_emit :stanza_recv, ps
      end
      
      s.signal_connect :received_message_stanza do |s,_,ms|
        signal_emit :stanza_recv, ms
      end 
        
      s.signal_connect :stanza_send do |s,o|
        signal_emit :stanza_send, o
      end
      
      signal_emit :connected
      
      s
    end
    
    def base_jid
      account.bare_jid.to_s
    end
    
    def jid
      account.full_jid.to_s
    end
    
    def conversation jid
      c = @app.db.get_conversations(account).find do |c_| c_.counterpart.bare_jid.to_s == jid end
    end
    
    def conversations
      @app.db.get_conversations(account)
    end
    
    def message jid,msg, ct: Dino::EntitiesConversationType::CHAT
      c = conversation jid
  
      c ||= Dino::EntitiesConversation.new(Xmpp::Jid.new(jid), account, ct); 
    
      c.encryption = Dino::EntitiesEncryption::OMEMO

      Dino.send_message(c, msg, 0, nil, Xmpp.xep_message_markup_get_spans(Xmpp::MessageStanza.new));
    end
    
    def call jid
    
    end
    
    def send s, &cb
      if s.is_a?(Xmpp::StanzaNode)
        return send_stanza(s,&cb)
      end
    
      r = Xmpp::StanzaReader.new(s);

      r.read_stanza_node do |sr,t,c|
        result = r.read_stanza_node_finish(t)
        
        send_stanza result,&cb
      end
    end
    
    def node name, **attrs
      n=Xmpp::StanzaNode.new(name, attrs[:xmlns]||'jabber:client')
     
      n.add_self_xmlns
      
      attrs.each do |k,v|
        n[k] = v if k != :xmlns
      end
      
      n
    end
    
    def send_stanza s, &cb
      stream.write_async(s, GLib::PRIORITY_DEFAULT, nil)
      
      if cb
        id=signal_connect :stanza_recv do |_,o|
          if (o['id'] == s['id']) && ((o.from!=jid) || (o.type!='get'))
            cb.call(s,o)
            signal_handler_disconnect id
          end
        end
      end
      
      s
    end
    
    def connected?
      stream != nil
    end
    
    def to_json *o
      ({jid: jid, base_jid: base_jid}.to_json(*o))
    end
    
    def disco_add_feature(ft) 
      a=stream.flags.find do |q| q.is_a?(Xmpp::XepServiceDiscoveryFlag) end
      a.add_own_feature(ft);
    end	
    
    require 'ffi'
    
    def own_disco_features()
      a=stream.flags.find do |q| q.is_a?(Xmpp::XepServiceDiscoveryFlag) end
      a=a.own_features
      
      (0..a.size-1).map do |i|
        FFI::Pointer.new(a.get(i)).read_string
      end
    end
    
    def self.map
      (@map||={})
    end
    
    def self.ensure app,jid,pass=nil, persist: true
      acct = app.db.accounts.find do |a|
        a.bare_jid.to_s == jid
      end
      
      persist = false if (!pass) && !acct
      
      acct ||= Dino::EntitiesAccount.new(Xmpp::Jid.new(jid), pass);
	  
      # Enable the account
      acct.enabled = true;
      # Persist the account
      acct.persist(app.db) if persist
      
      Entity.new(acct,app)
    end
    
    def self.new acct,app   
      map[acct.bare_jid.to_s] || super(acct,app)
    end
  end
  
  module ApplicationInterface
    attr_accessor :db, :search_path_generator, :settings, :stream_interactor, :search_path
    attr_writer   :plugin_registry
    
    def plugin_registry
      @plugin_registry ||= Dino::PluginsRegistry.new()
    end
  
    def get_stream_interaction_module(t)
      stream_interactor.get_module_by_type t
    end
    
    def signal_do_connected(e)
      
    end    
  
    def common
      @search_path               ||= ENV['SEARCH_PATH'] || File.expand_path("/usr/lib/gi-dino/plugins")

      self.search_path_generator = Dino::SearchPathGenerator.new(@search_path);
         
      init()
      
      signal_connect :activate do
        stream_interactor.signal_connect :stream_negotiated do |si, a,s|
          e        = Entity.new(a,self)
          e.stream = s

          signal_emit   :connected, e
          e.signal_emit :connected
        end
        
        get_stream_interaction_module(Dino::Calls.gtype).signal_connect :call_incoming do |_,call, state, conversation, video,multiparty|
          account(conversation.account.bare_jid.to_s).signal_emit(:call_incoming,call,state,conversation,video,multiparty)
        end
        
        get_stream_interaction_module(Dino::MessageProcessor.gtype).signal_connect(:message_received) do |_,m,c|
          account(m.ourpart.bare_jid.to_s).signal_emit(:message_recv, m.counterpart.bare_jid.to_s, m, m.type_, c);
        end
        
        hold()
      end
      
      loader = Dino::PluginsLoader.new(self);

      loader.load_all(); 
      
    end
    
    def account jid,pass=nil,persist: false
      Entity.ensure self,jid,pass, persist: persist
    end
  end
  
  class Application < Gio::Application
    type_register
    
    include Dino::Application
    include ApplicationInterface
    
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
    
    define_signal("connected",
                GLib::Signal::RUN_FIRST, # flags
                nil,                     # accumulator (XXX: not supported yet)
                nil,                     # return type (void == nil)
                Entity#, ...             # parameter types
                )
        
    def initialize
      super

      common
    end
  end
  
  module UI
    class Application < Gtk::Application
      type_register
      
      include Dino::Application
      include GIDX::ApplicationInterface
       
      install_property(GLib::Param::Object.new(
        "db", "Database", "db",
        Dino::Database.gtype,
        224 | GLib::Param::READABLE | GLib::Param::WRITABLE
      ))
      
      install_property(GLib::Param::Object.new(
        "search-path-generator","Search Path Generator","sp",
        Dino::SearchPathGenerator,
        224 | GLib::Param::READABLE | GLib::Param::WRITABLE
      ))
      
      install_property(GLib::Param::Object.new(
        "settings","Settings","s s",
        Dino::EntitiesSettings,
        224 | GLib::Param::READABLE | GLib::Param::WRITABLE
      ))
      
      install_property(GLib::Param::Object.new(
        "plugin-registry","Plugin Registry","pr",
        Dino::PluginsRegistry,
        224 | GLib::Param::READABLE | GLib::Param::WRITABLE
      ))
      
      install_property(GLib::Param::Object.new(
        "stream-interactor","Stream Interactore","si",
        Dino::StreamInteractor,
        224 | GLib::Param::READABLE | GLib::Param::WRITABLE
      ))

      define_signal("connected",
              GLib::Signal::RUN_FIRST, # flags
              nil,                     # accumulator (XXX: not supported yet)
              nil,                     # return type (void == nil)
              Entity                   # parameter types
              )

      def initialize
        super

        common
      end    
    end
    
    class CallWindow < DinoUI::UiCallWindow
      type_register
      
      def initialize state, stream_interactor
        super()
      
        self.controller = DinoUI::UiCallWindowController.new(self, state, stream_interactor)
      end
    end
  end
end

class App < GIDX::UI::Application
  def initialize
    super
    
    signal_connect :activate do
      e = account ARGV[1], ARGV[3], persist: true

      e.signal_connect :message_recv do |_,jid,m,t,c|
        puts <<~EOM
          MESSAGE:
            From: #{m.counterpart}
            Type: #{t.name}
            
              #{m.body}
        EOM
      end
      
      e.signal_connect :call_incoming do |_,call, state, conversation, video,multiparty|
        if Object.const_defined?("DinoUI")
        
          state.accept();

          call_window = GIDX::UI::CallWindow.new(state, stream_interactor);

          call_window.present();
        else
          STDERR.puts "Incoming call, but: DinoUI not loaded"
        end
      end
      
      e.signal_connect :stanza_recv do |e,s|
        puts s.to_xml if s['id'] == 'test1'
      end
      
      e.signal_connect :connected do
        stanza = <<~EOS
          <iq to='#{e.base_jid}' id='test1' type='get' xmlns='jabber:client'>
            <query xmlns='http://jabber.org/protocol/disco#items'></query>
          </iq>
        EOS
      
        e.send stanza do |s| p s end
        
        jid = ARGV[1]
        msg = 'Sevvy... SLEEP'
        
        e.message jid,msg
        e.call    jid
      end
    end
    
    # Any account connected
    signal_connect :connected do |_,e|
      e.disco_add_feature("urn:xmpp:microblog:0")
      e.disco_add_feature("urn:xmpp:microblog:0+notify")
      
      p r=e.own_disco_features;  
      
      stanza = e.node(:iq, type: 'get', id: 'test2', to: e.jid) << 
        e.node(:query, xmlns: 'http://jabber.org/protocol/disco#info')
      
      e.send stanza do |sent,response| 
        query    = response.get_subnode('query','http://jabber.org/protocol/disco#info',false)
        features = query.get_subnodes('feature',nil,false).map do |f|
           f[:var] 
        end
        
        p query
        p features.index('urn:xmpp:microblog:0+notify')
      end
    end
  end
end

App.new.run


