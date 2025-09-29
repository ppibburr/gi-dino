 namespace GIDX {
	using Dino;
	using Gee;
	using Dino.Entities;

	public delegate void send_cb(Xmpp.StanzaNode res);
	namespace Ui {
	  using Gee;
	  using Dino;
	  using Dino.Entities;
	  
	  /* Application
	   * 
	   * 
	   * */
	  public interface Application : Dino.Application {
 
		  
		public signal void connected(Entity e);
		  
		
		public void init() {	
			(this as Dino.Application).init();
			
			activate.connect(()=>{
			  stream_interactor.stream_negotiated.connect((a,s)=>{
				 var e=get_entity(a.bare_jid.to_string());
				 e.stream = (Xmpp.IoXmppStream)s;
				 e.connected(e.stream); 
			  });
			  
			  var calls = stream_interactor.get_module_by_type(typeof(Dino.Calls)) as Dino.Calls;
			  calls.call_incoming.connect((c,state,co,v,m)=>{
				 var e = get_entity(co.account.bare_jid.to_string(), null);
				 Gtk.Widget? w = e.call_incoming(co.counterpart.bare_jid.to_string(),v);
				 if (w != null) {
					state.accept();
					((Dino.Ui.CallWindow)w).controller = new Dino.Ui.CallWindowController((Dino.Ui.CallWindow)w,state,stream_interactor);
					//w.present();
				 }
			  });
			  
			  var mp    = stream_interactor.get_module_by_type(typeof(Dino.MessageProcessor)) as Dino.MessageProcessor;
			  mp.message_received.connect((m,c)=>{
				get_entity(c.account.bare_jid.to_string()).message_recv(m,c);  
			  });
			  
			  hold();
			});
		}  
		
		public virtual void handle_uri(string a, string b, Gee.Map<string,string> c) {
			
		}
		
		public virtual Entity? get_entity(string jid, string? password=null) {
		  if (Entity.map()[jid] != null) {
			 return Entity.map()[jid]; 
		  }
			
		  foreach (var a in db.get_accounts()) {
			  if (a.bare_jid.to_string()==jid) {
				  var e = new Entity(this, a);
				  Entity.map()[jid] = e;
				  return e;
			  }
		  }	
		  
		  if (password != null) {
			var n = new Account(new Xmpp.Jid(jid), password);
			n.persist(db);
			n.enabled=true;
			var e = new Entity(this, n);
			Entity.map()[jid]=e;
			return e;
		  }
		  
		  return null;
		}
	  }
  }
  
  /* Entity
   * 
   * Map an account to a stream and provide common features
   * 
   * */
  public class Entity : Object {
	  private static Gee.HashMap<string, Entity?> map_ = new Gee.HashMap<string, Entity?>();
	  public static Gee.HashMap<string, Entity?> map() {
		  return map_;
	  }
	  public signal void connected(Xmpp.IoXmppStream s);
	  public Xmpp.IoXmppStream stream {
		  set {
		  this._stream = value;
		  var s=value;
		  s.stanza_send.connect((st)=>{
		    stanza_send(st);	  
		  });
		  s.received_message_stanza.connect((s_,st)=>{
		    stanza_recv(st);	  
		  });
		  s.received_iq_stanza.connect((s_,st)=>{
		    stanza_recv(st);	  
		  });
		  stream.received_presence_stanza.connect((s_,st)=>{
		    stanza_recv(st);	  
		  });
	      }
	      get {
		    return _stream;	  
		  }
	  }
	  
	  public signal void stanza_send(Xmpp.StanzaNode s) {
		  
	  }
	  
	  public signal void stanza_recv(Xmpp.StanzaNode s) {
		 
	  }
	  
	  public signal Gtk.Widget? call_incoming(string from, bool video=false);
	  
	  public signal void message_recv(Dino.Entities.Message m, Dino.Entities.Conversation c);
	  
	  public signal void message_send();
	  
	  public Account? account {get;set;}
	  public Xmpp.Jid? jid {get;set;}
	  private Xmpp.IoXmppStream? _stream;
	  
	  public string? bare_jid {
		  owned get {
			  return account.bare_jid.to_string();
		  }
	  }
	  
	  public string? full_jid {
		  owned get {
			  return account.full_jid.to_string();
		  }
	  }
	  
	  public string? resource {
		  owned get {
			  return account.resourcepart;
		  }
	  }	 
	  
	  public Dino.Application app {get;set;}
	  
	  public Xmpp.XmppStreamFlag? get_flag(Type t) {
		  foreach (var f in stream.flags) {
			  if (t == f.get_type()) {
			    return f;
		      }
		  }
		  
		  return null;
	  }
	  
	  public string[] features {
	    owned get {
			var a = new string[]{};
			foreach (var f in ((Xmpp.Xep.ServiceDiscovery.Flag)get_flag(typeof(Xmpp.Xep.ServiceDiscovery.Flag))).own_features) {
				a+=f;
			}
			return a;
		}	  
	  }
	  
	  public void add_feature(string ft) {
		  ((Xmpp.Xep.ServiceDiscovery.Flag)get_flag(typeof(Xmpp.Xep.ServiceDiscovery.Flag))).add_own_feature(ft);
	  }
	  
	  
	  public Entity(Dino.Application app, Account a) {
		  this.account = a;
		  this.app = app;

	  } 
	  
	  public void call(string to, bool video=false) {
		  
	  }
	  
	  public void message(string to, string m) {
		  
	  }
	  
	  public void send_stanza_string(string str, send_cb? cb=null) {
		  var reader = new Xmpp.StanzaReader.for_string(str);
		  reader.read_stanza_node((t,r) => {
			 var s = reader.read_stanza_node.end(r);
		   	 
		   	 send_stanza(s,cb);
		  });
	  }
	  
	  public void send_stanza(Xmpp.StanzaNode s, send_cb? cb=null) {
		  if (cb!=null) {
			ulong id=0;
				
		    id=stanza_recv.connect((st,o)=>{
			  if ((o.get_attribute("id") == s.get_attribute("id")) && ((o.get_attribute("from") != account.full_jid.to_string()) || (o.get_attribute("type") != "get"))) {
				cb(o);
				this.disconnect(id);
			  }
			});
		  }
		stream.write_async(s);
	  }
	  
	  public Xmpp.StanzaNode stanza(string name, string xmlns="jabber:client", Gee.HashMap<string,string>? attrs=null) {
        var n = new Xmpp.StanzaNode.build(name, xmlns,null,null);
        n.add_self_xmlns();
        if (attrs!=null) {
			foreach(var attr in attrs.keys) {
				n.put_attribute(attr,attrs[attr],null);
			}
		}
        return n;
      }
      
	  public string? stanza_xml(void* ptr) {
		  var n = ((Xmpp.StanzaNode?)ptr);
		  if (n!=null) {
		    return n.to_xml();
	      }
	      return null;
	  }
	  
	  public string? stanza_name(void* ptr) {
		  var n = ((Xmpp.StanzaNode?)ptr);
		  if (n!=null) {
		    return n.name;
	      }
	      return null;
	  }
	  
	  public string? stanza_attr(void* ptr, string name) {
		  var n = ((Xmpp.StanzaNode?)ptr);
		  if (n!=null) {
		    return n.get_attribute(name);
	      }
	      return null;
	  }	  	  
  }
}


