require File.expand_path(File.join(File.dirname(__FILE__), "..", "xmpp/lib/xmpp"))

class Xmpp::StanzaNode
  def [] k
    get_attribute k
  end
  
  def []= k,v
    put_attribute k, v
  end
end

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
