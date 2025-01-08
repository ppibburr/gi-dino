# gi-dino
`GObjectIntropsection` capable version of `dino-im` - single file build system

===Example (xmpp)
```ruby
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
```

===Example (dino)
```ruby
#
# Answer an incoming call (audio/video)!
#

require File.expand_path(File.join(File.dirname(__FILE__), "..", "dino/lib/dino"))

require 'gtk4'

class GIApplication < Dino::GIApplication
  type_register

  def initialize(app_id="im.dino.GIDino")
      super application_id: app_id, flags: :handles_open

      init();	

      self.search_path_generator = Dino::SearchPathGenerator.new("../dino/build/")

      signal_connect :startup do end
      
      signal_connect "activate" do
        calls=get_stream_interaction_module(Dino::Calls.gtype)
      
        calls.signal_connect :call_incoming do |_,call, state, conversation, video,multiparty|
          state.accept();

          call_window = DinoUI::UiCallWindow.new();
          call_window.controller = DinoUI::UiCallWindowController.new(call_window, state, stream_interactor);
          call_window.present();
        end

        # an account stream has connected
        stream_interactor.signal_connect :stream_negotiated do |si, acct, stream|
          p acct: acct
        end
        
        hold();
      end
  end
end

@app=GIApplication.new
loader = Dino::PluginsLoader.new(@app);
loader.load_all();
@app.run
```
